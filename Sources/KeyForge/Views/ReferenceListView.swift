import SwiftUI

struct ReferenceListView: View {
    let items: [ReferenceItem]
    @Binding var selectedItemID: ReferenceItem.ID?
    let copyItem: (ReferenceItem) -> Void

    var body: some View {
        ScrollViewReader { proxy in
            Group {
                if items.isEmpty {
                    EmptyResultsView()
                } else {
                    ScrollView {
                        LazyVStack(spacing: 9) {
                            ForEach(items) { item in
                                ReferenceRow(
                                    item: item,
                                    isSelected: selectedItemID == item.id
                                )
                                .id(item.id)
                                .onTapGesture { selectedItemID = item.id }
                                .contextMenu {
                                    Button("Copy \(item.kind.rawValue)") { copyItem(item) }
                                }
                            }
                        }
                        .padding(20)
                    }
                }
            }
            .background(KeyForgeTheme.background)
            .onChange(of: selectedItemID) { _, newValue in
                guard let newValue else { return }
                withAnimation(.easeOut(duration: 0.12)) {
                    proxy.scrollTo(newValue, anchor: .center)
                }
            }
        }
    }
}
