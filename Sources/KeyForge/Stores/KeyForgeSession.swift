import Foundation
import Observation

@Observable
final class KeyForgeSession {
    private let items: [ReferenceItem]

    var category: ReferenceCategory? = .macOS
    var selectedItemID: ReferenceItem.ID?
    var query = ""
    var commandText = ""
    var mode: EditorMode = .normal
    var statusMessage = "local reference index"
    var showsHelp = false

    init(items: [ReferenceItem] = ReferenceRepository().items) {
        self.items = items
        selectedItemID = visibleItems.first?.id
    }

    var visibleItems: [ReferenceItem] {
        ReferenceSearch.filter(items, query: query, category: category)
    }

    var selectedItem: ReferenceItem? {
        visibleItems.first { $0.id == selectedItemID }
    }

    var counts: [ReferenceCategory: Int] {
        Dictionary(grouping: items, by: \.category).mapValues(\.count)
    }

    var totalCount: Int { items.count }

    func selectCategory(_ category: ReferenceCategory?) {
        self.category = category
        normalizeSelection(preferFirst: true)
        statusMessage = category?.rawValue ?? "All references"
    }

    func moveSelection(by offset: Int) {
        guard !visibleItems.isEmpty else { return }
        let current = selectedItemID.flatMap { id in visibleItems.firstIndex { $0.id == id } } ?? 0
        let next = min(max(current + offset, 0), visibleItems.count - 1)
        selectedItemID = visibleItems[next].id
    }

    func moveToBoundary(first: Bool) {
        selectedItemID = first ? visibleItems.first?.id : visibleItems.last?.id
    }

    func switchCategory(by offset: Int) {
        let categories: [ReferenceCategory?] = [nil] + ReferenceCategory.allCases.map(Optional.some)
        let current = categories.firstIndex { $0 == category } ?? 0
        let next = min(max(current + offset, 0), categories.count - 1)
        selectCategory(categories[next])
    }

    func beginSearch() {
        mode = .search
        statusMessage = "type a query · Enter confirm · Esc normal"
    }

    func beginCommand() {
        mode = .command
        commandText = ""
        statusMessage = ":search · :open · :next · :prev · :clear · :help"
    }

    func updateSearch() {
        normalizeSelection(preferFirst: true)
    }

    func returnToNormal() {
        mode = .normal
        commandText = ""
        statusMessage = "NORMAL · keyboard ready"
    }

    @discardableResult
    func executeCommand() -> Bool {
        guard let command = PaletteCommand.parse(commandText) else {
            statusMessage = "E492: Not a KeyForge command"
            return false
        }

        switch command {
        case .search(let value):
            query = value
            normalizeSelection(preferFirst: true)
            statusMessage = value.isEmpty ? "search cleared" : "/\(value)"
        case .open(let category):
            query = ""
            selectCategory(category)
        case .next:
            moveSelection(by: 1)
            statusMessage = "next reference"
        case .previous:
            moveSelection(by: -1)
            statusMessage = "previous reference"
        case .clear:
            query = ""
            normalizeSelection(preferFirst: true)
            statusMessage = "search cleared"
        case .help:
            showsHelp = true
            statusMessage = "KeyForge keymap"
        }

        mode = .normal
        commandText = ""
        return true
    }

    private func normalizeSelection(preferFirst: Bool) {
        if !preferFirst, let selectedItemID, visibleItems.contains(where: { $0.id == selectedItemID }) {
            return
        }
        selectedItemID = visibleItems.first?.id
    }
}
