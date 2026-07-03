import Foundation

struct ReferenceRepository: Sendable {
    let items: [ReferenceItem]

    init(items: [ReferenceItem] = SeedData.items) {
        self.items = items
    }
}
