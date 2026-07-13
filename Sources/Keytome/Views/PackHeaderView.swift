import SwiftUI

struct PackHeaderView: View {
    @Bindable var session: KeytomeSession
    let style: PackVisualStyle

    var body: some View {
        ZStack(alignment: .topTrailing) {
            PackHeroArtwork(style: style, symbol: session.category?.systemImage ?? "square.stack.3d.up")
                .frame(width: 390)
                .opacity(0.86)
                .padding(.trailing, 10)

            VStack(alignment: .leading, spacing: 14) {
                ViewThatFits(in: .horizontal) {
                    regularHeader
                    compactHeader
                }
                groupPicker
            }
            .frame(maxWidth: .infinity, alignment: .topLeading)
        }
        .padding(.horizontal, 24)
        .padding(.vertical, 19)
        .frame(minHeight: 172)
        .background(
            LinearGradient(
                colors: [style.surface.opacity(0.92), style.background.opacity(0.78), style.accent.opacity(0.08)],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
        .overlay(alignment: .bottom) { Rectangle().fill(style.accent.opacity(0.24)).frame(height: 1) }
    }

    private var regularHeader: some View {
        HStack(spacing: 17) {
            packIcon(size: 62)
            titleBlock
            Spacer(minLength: 220)
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
        VStack(alignment: .leading, spacing: 7) {
            Text(style.label)
                .font(.system(size: 9, weight: .bold, design: .monospaced))
                .tracking(1.4)
                .foregroundStyle(style.accent.opacity(0.92))
            Text("\(session.category?.rawValue ?? "All") Shortcuts")
                .font(.system(size: titleSize, weight: .bold, design: style.fontDesign))
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
        HStack(spacing: 7) {
            factPill("\(session.packItems.count)", "shortcuts")
            factPill("\(session.availableGroups.count)", "groups")
        }
        .padding(8)
        .background(Color.black.opacity(0.18), in: RoundedRectangle(cornerRadius: 13))
        .overlay { RoundedRectangle(cornerRadius: 13).stroke(style.accent.opacity(0.16)) }
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
                .foregroundStyle(selected ? groupForeground : .secondary)
                .background(groupBackground(selected: selected), in: RoundedRectangle(cornerRadius: 8))
                .overlay { RoundedRectangle(cornerRadius: 8).stroke(style.accent.opacity(selected ? 0.66 : 0.16)) }
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

    private func factPill(_ value: String, _ label: String) -> some View {
        VStack(spacing: 1) {
            Text(value)
                .font(.system(size: 13, weight: .bold, design: .monospaced))
                .foregroundStyle(style.accent)
            Text(label.uppercased())
                .font(.system(size: 7, weight: .bold, design: .monospaced))
                .foregroundStyle(style.secondary.opacity(0.68))
        }
        .frame(width: 64, height: 43)
        .background(style.background.opacity(0.62), in: RoundedRectangle(cornerRadius: 9))
    }

    private func groupBackground(selected: Bool) -> some ShapeStyle {
        if selected {
            return AnyShapeStyle(LinearGradient(colors: [style.accent.opacity(0.24), style.secondary.opacity(0.12)], startPoint: .topLeading, endPoint: .bottomTrailing))
        }
        return AnyShapeStyle(Color.black.opacity(0.22))
    }

    private var groupForeground: Color {
        switch style.keycapTreatment {
        case .paper: .black
        default: style.accent
        }
    }

    private var titleSize: CGFloat {
        switch style.composition {
        case .ideSplit, .creative, .game, .blueprint, .mythic: 30
        default: 28
        }
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
