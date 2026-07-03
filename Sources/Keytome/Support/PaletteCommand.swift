import Foundation

enum PaletteCommand: Equatable {
    case search(String)
    case open(ReferenceCategory?)
    case next
    case previous
    case clear
    case help

    static func parse(_ input: String) -> PaletteCommand? {
        let normalized = input.trimmingCharacters(in: .whitespacesAndNewlines)
        let command = normalized.hasPrefix(":") ? String(normalized.dropFirst()) : normalized
        let parts = command.split(maxSplits: 1, whereSeparator: \.isWhitespace).map(String.init)
        guard let name = parts.first?.lowercased() else { return nil }
        let argument = parts.count > 1 ? parts[1].trimmingCharacters(in: .whitespaces) : ""

        switch name {
        case "search", "s":
            return .search(argument)
        case "open", "o":
            guard !argument.isEmpty else { return nil }
            if ["all", "references", "all references"].contains(argument.lowercased()) {
                return .open(nil)
            }
            guard let category = ReferenceCategory.allCases.first(where: {
                $0.rawValue.caseInsensitiveCompare(argument) == .orderedSame ||
                $0.rawValue.replacingOccurrences(of: " / ", with: "").caseInsensitiveCompare(argument) == .orderedSame
            }) else { return nil }
            return .open(category)
        case "next", "n":
            return .next
        case "prev", "previous", "p":
            return .previous
        case "clear", "nohl":
            return .clear
        case "help", "h", "?":
            return .help
        default:
            return nil
        }
    }
}
