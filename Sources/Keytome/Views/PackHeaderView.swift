import SwiftUI

struct PackHeaderView: View {
    @Bindable var session: KeytomeSession
    let style: PackVisualStyle

    var body: some View {
        VStack(alignment: .leading, spacing: 14) {
            ViewThatFits(in: .horizontal) {
                regularHeader
                compactHeader
            }
            groupPicker
        }
        .padding(.horizontal, 24)
        .padding(.vertical, 20)
        .background(
            LinearGradient(
                colors: [style.surface.opacity(0.88), style.background.opacity(0.72)],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
        .overlay(alignment: .bottom) { Rectangle().fill(style.accent.opacity(0.24)).frame(height: 1) }
    }

    private var regularHeader: some View {
        HStack(spacing: 18) {
            packIcon(size: 62)
            titleBlock
            Spacer(minLength: 18)
            packFacts
        }
    }

    private var compactHeader: some View {
        HStack(alignment: .top, spacing: 13) {
            packIcon(size: 46)
            titleBlock
            Spacer(minLength: 0)
        }
    }

    private var titleBlock: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("\(session.category?.rawValue ?? "All") Shortcuts")
                .font(.system(size: 28, weight: .bold, design: style.fontDesign))
                .foregroundStyle(.primary)
                .lineLimit(2)
                .minimumScaleFactor(0.78)
            Text(subtitle)
                .font(.system(size: 12, weight: .medium, design: style.fontDesign))
                .foregroundStyle(style.secondary.opacity(0.82))
                .lineLimit(2)
        }
    }

    private var packFacts: some View {
        VStack(alignment: .trailing, spacing: 6) {
            Text(style.label)
                .font(.system(size: 9, weight: .bold, design: .monospaced))
                .tracking(1.1)
                .foregroundStyle(style.accent)
            Text("\(session.packItems.count) shortcuts")
                .font(.system(size: 11, weight: .semibold, design: .monospaced))
                .foregroundStyle(.secondary)
        }
    }

    private var groupPicker: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 7) {
                groupButton(nil, title: "All", symbol: "square.grid.2x2")
                ForEach(session.availableGroups) { group in
                    groupButton(group, title: group.title, symbol: group.systemImage)
                }
            }
        }
        .accessibilityLabel("Shortcut groups")
    }

    private func groupButton(_ group: ReferenceGroup?, title: String, symbol: String) -> some View {
        let selected = session.selectedGroup == group
        return Button { session.selectGroup(group) } label: {
            Label(title, systemImage: symbol)
                .font(.system(size: 10, weight: selected ? .bold : .medium, design: .monospaced))
                .padding(.horizontal, 11)
                .frame(height: 30)
                .foregroundStyle(selected ? style.accent : .secondary)
                .background(selected ? style.accent.opacity(0.16) : Color.black.opacity(0.18), in: RoundedRectangle(cornerRadius: 7))
                .overlay { RoundedRectangle(cornerRadius: 7).stroke(style.accent.opacity(selected ? 0.65 : 0.16)) }
        }
        .buttonStyle(.plain)
        .accessibilityAddTraits(selected ? .isSelected : [])
    }

    private func packIcon(size: CGFloat) -> some View {
        Image(systemName: session.category?.systemImage ?? "square.stack.3d.up")
            .font(.system(size: size * 0.42, weight: .semibold))
            .foregroundStyle(style.accent)
            .frame(width: size, height: size)
            .background(style.accent.opacity(0.12), in: RoundedRectangle(cornerRadius: size * 0.22))
            .overlay { RoundedRectangle(cornerRadius: size * 0.22).stroke(style.accent.opacity(0.42)) }
            .shadow(color: style.accent.opacity(0.2), radius: 14)
    }

    private var subtitle: String {
        switch session.category {
        case .macOS: "System, Finder, and everyday Mac navigation."
        case .terminal: "Terminal.app and shell editing without leaving the keyboard."
        case .homebrew: "Packages, services, diagnostics, and Brewfiles."
        case .zsh: "Shell navigation, composition, processes, and configuration."
        case .vimNvim: "Modal editing motions, commands, and workflows."
        case .jetBrains: "Shared shortcuts for the JetBrains macOS keymap."
        case .visualStudio: "Build, navigate, and debug with the General profile."
        case .xcode: "Build, navigate, edit, and debug Apple-platform projects."
        case .obsidian: "Navigate, write, link, and explore your knowledge graph."
        case .blender, .unity, .unrealEngine: "Create, navigate, and run with a keyboard-first workflow."
        case .claudeCode, .openAICodex, .aider, .hermesAgent, .openClaw: "Agent and terminal commands for faster local workflows."
        case nil: "Every local KeyTome reference pack in one searchable index."
        default: "Essential shortcuts for a faster, focused workflow."
        }
    }
}
