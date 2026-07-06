import Foundation

struct ReferenceGroup: Identifiable, Hashable, Sendable {
    let id: String
    let title: String
    let systemImage: String

    static let essentials = ReferenceGroup(id: "essentials", title: "Essentials", systemImage: "sparkles")
    static let navigation = ReferenceGroup(id: "navigation", title: "Navigation", systemImage: "arrow.triangle.swap")
    static let editing = ReferenceGroup(id: "editing", title: "Editing", systemImage: "pencil.line")
    static let search = ReferenceGroup(id: "search", title: "Search", systemImage: "magnifyingglass")
    static let workflow = ReferenceGroup(id: "workflow", title: "Workflow", systemImage: "point.3.connected.trianglepath.dotted")
    static let commands = ReferenceGroup(id: "commands", title: "Commands", systemImage: "apple.terminal")

    static func resolve(_ item: ReferenceItem) -> ReferenceGroup {
        let words = ([item.title, item.description] + item.tags).joined(separator: " ").lowercased()
        if item.kind == .command { return .commands }
        if words.contains("search") || words.contains("find") || words.contains("palette") { return .search }
        if words.contains("navigate") || words.contains("navigation") || words.contains("tab") || words.contains("window") || words.contains("motion") { return .navigation }
        if words.contains("edit") || words.contains("format") || words.contains("copy") || words.contains("paste") || words.contains("selection") { return .editing }
        if words.contains("build") || words.contains("run") || words.contains("debug") || words.contains("agent") || words.contains("workflow") { return .workflow }
        return .essentials
    }

    static func available(in items: [ReferenceItem]) -> [ReferenceGroup] {
        let present = Set(items.map(resolve))
        return [essentials, navigation, editing, search, workflow, commands].filter(present.contains)
    }
}
