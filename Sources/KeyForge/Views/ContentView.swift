import SwiftUI

struct ContentView: View {
    private let repository = ReferenceRepository()

    @State private var category: ReferenceCategory?
    @State private var selectedItemID: ReferenceItem.ID?
    @State private var query = ""
    @FocusState private var searchIsFocused: Bool

    private var visibleItems: [ReferenceItem] {
        repository.items.filter { category == nil || $0.category == category }
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
                    selectedItemID: $selectedItemID
                )

                FooterView()
            }
            .background(KeyForgeTheme.background)
        }
        .frame(minWidth: 820, minHeight: 560)
        .preferredColorScheme(.dark)
    }
}
