import Foundation

enum ReferenceCategory: String, CaseIterable, Codable, Identifiable, Sendable {
    case macOS
    case chrome = "Chrome"
    case firefox = "Firefox"
    case dia = "Dia"
    case brave = "Brave"
    case terminal = "Terminal"
    case homebrew = "Homebrew"
    case zsh
    case vimNvim = "Vim / Nvim"
    case jetBrains = "JetBrains IDEs"
    case visualStudio = "Visual Studio"
    case xcode = "Xcode"
    case cursor = "Cursor"
    case githubCopilot = "GitHub Copilot"
    case zed = "Zed"
    case zedAgent = "Zed Agent"
    case windsurf = "Windsurf"
    case claudeCode = "Claude Code"
    case openAICodex = "OpenAI Codex"
    case aider = "Aider"
    case junie = "JetBrains Junie"
    case cline = "Cline"
    case warp = "Warp"
    case replit = "Replit"
    case firebaseStudio = "Firebase Studio"
    case obsidian = "Obsidian"
    case codexApp = "Codex App"
    case hermesAgent = "Hermes Agent"
    case openClaw = "OpenClaw"
    case blender = "Blender"
    case unity = "Unity"
    case unrealEngine = "Unreal Engine"

    var id: String { rawValue }

    var systemImage: String {
        switch self {
        case .macOS: "desktopcomputer"
        case .chrome: "globe"
        case .firefox: "flame"
        case .dia: "circle.grid.cross"
        case .brave: "shield"
        case .terminal: "apple.terminal"
        case .homebrew: "mug"
        case .zsh: "chevron.left.forwardslash.chevron.right"
        case .vimNvim: "v.square"
        case .jetBrains: "brain.head.profile"
        case .visualStudio: "chevron.left.forwardslash.chevron.right"
        case .xcode: "hammer"
        case .cursor: "cursorarrow.rays"
        case .githubCopilot: "person.crop.circle.badge.checkmark"
        case .zed: "bolt.square"
        case .zedAgent: "bolt.horizontal.circle"
        case .windsurf: "wind"
        case .claudeCode: "terminal"
        case .openAICodex: "chevron.left.forwardslash.chevron.right"
        case .aider: "bubble.left.and.text.bubble.right"
        case .junie: "sparkles"
        case .cline: "point.3.connected.trianglepath.dotted"
        case .warp: "waveform.path"
        case .replit: "square.grid.3x3.square"
        case .firebaseStudio: "flame.fill"
        case .obsidian: "diamond"
        case .codexApp: "app.badge"
        case .hermesAgent: "paperplane"
        case .openClaw: "pawprint"
        case .blender: "cube.transparent"
        case .unity: "cube"
        case .unrealEngine: "gamecontroller"
        }
    }

    var commandAliases: [String] {
        switch self {
        case .jetBrains: ["jetbrains", "intellij", "idea"]
        case .visualStudio: ["visualstudio", "vs"]
        case .xcode: ["xcode"]
        case .githubCopilot: ["copilot", "githubcopilot", "ghcopilot"]
        case .zedAgent: ["zedagent", "zed-ai", "zedai"]
        case .claudeCode: ["claude", "claudecode"]
        case .openAICodex: ["codex", "codexcli", "openaicodex"]
        case .firebaseStudio: ["firebase", "firebasestudio", "idx"]
        case .codexApp: ["codexapp", "codexdesktop"]
        case .hermesAgent: ["hermes", "hermesagent"]
        case .openClaw: ["openclaw", "claw"]
        case .unrealEngine: ["unreal", "unrealengine", "ue"]
        case .junie: ["junie", "jetbrainsjunie"]
        default: []
        }
    }
}
