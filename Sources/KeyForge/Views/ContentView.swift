import SwiftUI

struct ContentView: View {
    private let repository = ReferenceRepository()

    @State private var category: ReferenceCategory?
    @State private var selectedItemID: ReferenceItem.ID?
    @State private var query = ""
    @FocusState private var searchIsFocused: Bool

    private var visibleItems: [ReferenceItem] {
        ReferenceSearch.filter(repository.items, query: query, category: category)
    }

    private var selectedItem: ReferenceItem? {
        visibleItems.first { $0.id == selectedItemID }
    }

    var body: some View {
        NavigationSplitView {
            SidebarView(
                selection: $category,
                counts: Dictionary(grouping: repository.items, by: \.category).mapValues(\.count),
                totalCount: repository.items.count
            )
            .navigationSplitViewColumnWidth(min: 180, ideal: 210, max: 250)
        } detail: {
            VStack(spacing: 0) {
                HeaderView(
                    category: category,
                    resultCount: visibleItems.count,
                    query: $query,
                    searchIsFocused: $searchIsFocused
                )

                Divider().overlay(KeyForgeTheme.border)

                ReferenceListView(
                    items: visibleItems,
                    selectedItemID: $selectedItemID,
                    copyItem: copy
                )

                FooterView()
            }
            .background(KeyForgeTheme.background)
        }
        .frame(minWidth: 820, minHeight: 560)
        .preferredColorScheme(.dark)
        .task { searchIsFocused = true }
        .onChange(of: query) { _, _ in normalizeSelection() }
        .onChange(of: category) { _, _ in normalizeSelection() }
        .onKeyPress(phases: .down) { press in
            if press.modifiers == .command && press.characters == "f" {
                searchIsFocused = true
                return .handled
            }
            if press.modifiers == .command && press.characters == "c", let selectedItem {
                copy(selectedItem)
                return .handled
            }
            if press.key == .escape {
                if !query.isEmpty {
                    query = ""
                    return .handled
                }
                searchIsFocused = false
            }
            return .ignored
        }
    }

    private func normalizeSelection() {
        if let selectedItemID, visibleItems.contains(where: { $0.id == selectedItemID }) {
            return
        }
        selectedItemID = visibleItems.first?.id
    }

    private func copy(_ item: ReferenceItem) {
        Pasteboard.copy(item.value)
    }
}
