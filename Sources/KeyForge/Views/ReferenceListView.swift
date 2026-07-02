import SwiftUI

struct ReferenceListView: View {
    let items: [ReferenceItem]
    let selectedItemID: ReferenceItem.ID?
    let selectItem: (ReferenceItem.ID) -> Void
    let copyItem: (ReferenceItem) -> Void

    var body: some View {
        ScrollViewReader { proxy in
            VStack(spacing: 0) {
                tableHeader

                if items.isEmpty {
                    EmptyResultsView()
                } else {
                    ScrollView {
                        LazyVStack(spacing: 0) {
                            ForEach(Array(items.enumerated()), id: \.element.id) { index, item in
                                ReferenceRow(item: item, lineNumber: index + 1, isSelected: selectedItemID == item.id)
                                    .id(item.id)
                                    .onTapGesture { selectItem(item.id) }
                                    .contextMenu {
                                        Button("Yank \(item.kind.rawValue)") { copyItem(item) }
                                    }
                            }
                        }
                    }
                }
            }
            .background(KeyForgeTheme.background)
            .onChange(of: selectedItemID) { _, selectedID in
                guard let selectedID else { return }
                withAnimation(.easeOut(duration: 0.1)) {
                    proxy.scrollTo(selectedID, anchor: .center)
                }
            }
        }
    }

    private var tableHeader: some View {
        HStack(spacing: 0) {
            Text("#").frame(width: 42, alignment: .trailing)
            Text("COMMAND").frame(width: 230, alignment: .leading).padding(.leading, 20)
            Text("KEYBIND").frame(width: 190, alignment: .leading)
            Text("DESCRIPTION").frame(maxWidth: .infinity, alignment: .leading)
            Color.clear.frame(width: 42)
        }
        .font(.system(size: 10, weight: .bold, design: .monospaced))
        .foregroundStyle(KeyForgeTheme.blueMuted)
        .padding(.horizontal, 22)
        .frame(height: 38)
        .overlay(alignment: .bottom) {
            Rectangle().fill(KeyForgeTheme.borderStrong).frame(height: 1)
        }
    }
}
