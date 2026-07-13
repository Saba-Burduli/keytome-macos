import SwiftUI

struct ReferenceListView: View {
    @Environment(\.accessibilityReduceMotion) private var reduceMotion

    @Bindable var session: KeytomeSession
    let copyItem: (ReferenceItem) -> Void
    var contentState: PackContentState = .ready

    private var style: PackVisualStyle {
        session.category.map(PackVisualStyle.init(category:)) ?? .index
    }

    var body: some View {
        GeometryReader { geometry in
            ScrollViewReader { proxy in
                ZStack {
                    PackDesignBackground(style: style)

                    VStack(spacing: 0) {
                        PackHeaderView(session: session, style: style)
                        tableHeader
                        content(isCompact: PackLayoutMetrics.isCompact(detailWidth: geometry.size.width))
                    }
                }
                .onChange(of: session.selectedItemID) { _, selectedID in
                    guard let selectedID else { return }
                    withAnimation(reduceMotion ? nil : .easeOut(duration: 0.12)) {
                        proxy.scrollTo(selectedID, anchor: .center)
                    }
                }
            }
        }
    }

    @ViewBuilder
    private func content(isCompact: Bool) -> some View {
        if contentState == .loading {
            LoadingPackView(style: style)
        } else if session.visibleItems.isEmpty {
            EmptyResultsView(
                query: session.query,
                group: session.selectedGroup,
                accent: style.accent,
                clearFilters: clearFilters
            )
        } else {
            ScrollView {
                LazyVStack(spacing: rowSpacing) {
                    ForEach(Array(session.visibleItems.enumerated()), id: \.element.id) { index, item in
                        ReferenceRow(
                            item: item,
                            lineNumber: index + 1,
                            isSelected: session.selectedItemID == item.id,
                            isCompact: isCompact,
                            style: style,
                            copyItem: { copyItem(item) }
                        )
                        .id(item.id)
                        .onTapGesture { session.selectedItemID = item.id }
                        .contextMenu { Button("Yank \(item.kind.rawValue)") { copyItem(item) } }
                    }
                }
                .padding(listInset)
                .background(listPanelBackground, in: RoundedRectangle(cornerRadius: listCornerRadius))
                .overlay { RoundedRectangle(cornerRadius: listCornerRadius).stroke(style.accent.opacity(listBorderOpacity)) }
                .frame(maxWidth: contentWidth)
                .padding(.horizontal, 12)
                .padding(.vertical, 12)
                .frame(maxWidth: .infinity)
            }
        }
    }

    private var tableHeader: some View {
        HStack {
            Text(primaryColumnTitle)
            Spacer()
            Text(secondaryColumnTitle)
        }
        .font(.system(size: 9, weight: .bold, design: .monospaced))
        .foregroundStyle(style.secondary.opacity(0.7))
        .padding(.horizontal, 28)
        .frame(height: 32)
        .background(style.background.opacity(0.86))
        .overlay(alignment: .bottom) { Rectangle().fill(style.accent.opacity(0.14)).frame(height: 1) }
    }

    private var primaryColumnTitle: String {
        switch style.rowTreatment {
        case .commandTable: "COMMAND"
        case .denseTable: "ACTION / DESCRIPTION"
        default: "ACTION"
        }
    }

    private var secondaryColumnTitle: String {
        switch style.rowTreatment {
        case .denseTable: "KEY"
        default: "SHORTCUT / COMMAND"
        }
    }

    private var rowSpacing: CGFloat {
        switch style.rowTreatment {
        case .denseTable: 3
        case .commandTable: 5
        default: 8
        }
    }

    private var listInset: EdgeInsets {
        switch style.rowTreatment {
        case .denseTable: EdgeInsets(top: 7, leading: 7, bottom: 7, trailing: 7)
        default: EdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8)
        }
    }

    private var contentWidth: CGFloat {
        switch style.design {
        case .macOS: 1120
        case .chrome: 1120
        case .firefox: 1080
        case .dia: 1100
        case .brave: 1160
        case .terminal: 1100
        case .homebrew: 1140
        case .zsh: 1120
        case .vimNvim: 1160
        case .jetBrains: 1120
        case .visualStudio: 1100
        case .xcode: 1080
        case .cursor: 1120
        case .githubCopilot: 1100
        case .zed: 1120
        case .zedAgent: 1100
        case .windsurf: 1180
        case .claudeCode: 1080
        case .openAICodex: 1100
        case .aider: 1120
        case .junie: 1160
        case .cline: 1160
        case .warp: 1140
        case .replit: 1140
        case .firebaseStudio: 1100
        case .obsidian: 1120
        case .codexApp: 1160
        case .hermesAgent: 1080
        case .openClaw: 1100
        case .blender: 1140
        case .unity: 1180
        case .unrealEngine: 1180
        }
    }

    private var listPanelBackground: Color {
        switch style.rowTreatment {
        case .denseTable, .commandTable: style.background.opacity(0.36)
        default: style.background.opacity(0.18)
        }
    }

    private var listCornerRadius: CGFloat {
        style.rowTreatment == .denseTable ? 10 : 14
    }

    private var listBorderOpacity: Double {
        style.rowTreatment == .denseTable ? 0.1 : 0.16
    }

    private func clearFilters() {
        session.query = ""
        session.selectGroup(nil)
        session.updateSearch()
    }
}
