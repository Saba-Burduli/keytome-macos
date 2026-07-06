import Foundation

struct ShortcutChord: Equatable, Sendable {
    struct Stroke: Equatable, Sendable {
        let keys: [String]
    }

    let strokes: [Stroke]

    init(_ value: String) {
        let normalized = value
            .replacingOccurrences(of: "Ctrl", with: "⌃")
            .replacingOccurrences(of: "Control", with: "⌃")
            .replacingOccurrences(of: "Command", with: "⌘")
            .replacingOccurrences(of: "Cmd", with: "⌘")
            .replacingOccurrences(of: "Option", with: "⌥")
            .replacingOccurrences(of: "Alt", with: "⌥")
            .replacingOccurrences(of: "Shift", with: "⇧")
            .replacingOccurrences(of: "+", with: " ")

        let tokens = normalized.split(whereSeparator: \.isWhitespace).map(String.init)
        var result: [Stroke] = []
        var current: [String] = []
        let modifiers: Set<String> = ["⌘", "⌥", "⌃", "⇧", "Fn"]

        for token in tokens {
            if current.contains(where: { !modifiers.contains($0) }) {
                result.append(Stroke(keys: current))
                current = []
            }
            current.append(token)
        }
        if !current.isEmpty { result.append(Stroke(keys: current)) }
        strokes = result.isEmpty ? [Stroke(keys: [value])] : result
    }
}
