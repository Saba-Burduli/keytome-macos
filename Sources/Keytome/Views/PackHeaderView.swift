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
        switch style.design {
        case .macOS: 30
        case .chrome: 29
        case .firefox: 29
        case .dia: 31
        case .brave: 29
        case .terminal: 29
        case .homebrew: 30
        case .zsh: 31
        case .vimNvim: 29
        case .jetBrains: 30
        case .visualStudio: 30
        case .xcode: 30
        case .cursor: 30
        case .githubCopilot: 29
        case .zed: 31
        case .zedAgent: 29
        case .windsurf: 30
        case .claudeCode: 29
        case .openAICodex: 29
        case .aider: 31
        case .junie: 30
        case .cline: 31
        case .warp: 31
        case .replit: 30
        case .firebaseStudio: 28
        case .obsidian: 30
        case .codexApp: 29
        case .hermesAgent: 29
        case .openClaw: 30
        case .blender: 31
        case .unity: 31
        case .unrealEngine: 29
        }
    }

    private var subtitle: String {
        switch session.category {
        case .macOS: "System, Finder, and everyday Mac navigation."
        case .chrome: "Tabs, browsing, search, and Chrome DevTools."
        case .firefox: "Private browsing, downloads, tabs, and Firefox tools."
        case .dia: "Navigate, collaborate, and create with Dia AI."
        case .brave: "Private browsing, shields, tabs, and privacy controls."
        case .terminal: "Terminal.app and shell editing without leaving the keyboard."
        case .homebrew: "Packages, services, diagnostics, and Brewfiles."
        case .zsh: "Shell navigation, composition, processes, and configuration."
        case .vimNvim: "Modal editing motions, commands, and workflows."
        case .jetBrains: "Shared shortcuts for the JetBrains macOS keymap."
        case .visualStudio: "Build, navigate, and debug with the General profile."
        case .xcode: "Build, navigate, edit, and debug Apple-platform projects."
        case .cursor: "Compose, generate, and apply edits with Cursor AI."
        case .githubCopilot: "Chat, navigate, and accept suggestions with Copilot."
        case .zed: "Fast editor navigation in Zed's focused workspace."
        case .zedAgent: "Run agents, manage threads, and refine suggestions in Zed."
        case .windsurf: "Plan, code, and ask through Windsurf Cascade."
        case .claudeCode: "Plan, prompt, submit, and review Claude Code sessions."
        case .openAICodex: "Run tasks, inspect diffs, and manage Codex CLI sessions."
        case .aider: "Pair program through Aider chat, diffs, and commits."
        case .junie: "Plan, run, and guide JetBrains Junie agent workflows."
        case .cline: "Manage Cline tasks, checkpoints, tools, and approvals."
        case .warp: "Command blocks, AI generation, and terminal navigation."
        case .replit: "Build, run, deploy, and work with Replit Agent."
        case .firebaseStudio: "Prototype, preview, and deploy from Firebase Studio."
        case .obsidian: "Navigate, write, link, and explore your knowledge graph."
        case .codexApp: "Start threads, search work, and review diffs in Codex."
        case .hermesAgent: "Route messages and inspect local Hermes Agent status."
        case .openClaw: "Operate agents, gateways, skills, and logs in OpenClaw."
        case .blender: "Model, transform, and navigate Blender's 3D viewport."
        case .unity: "Move through scenes, tools, play mode, and selections."
        case .unrealEngine: "Build worlds with viewport and Blueprint controls."
        case nil: "Every local KeyTome reference pack in one searchable index."
        }
    }
}
