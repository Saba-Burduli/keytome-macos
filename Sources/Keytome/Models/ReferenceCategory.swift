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
        }
    }

    var commandAliases: [String] {
        switch self {
        case .jetBrains: ["jetbrains", "intellij", "idea"]
        case .visualStudio: ["visualstudio", "vs"]
        case .xcode: ["xcode"]
        default: []
        }
    }
}
