import Foundation

struct ReferenceItem: Identifiable, Codable, Hashable, Sendable {
    enum Kind: String, Codable, Sendable {
        case shortcut
        case command
    }

    enum Confidence: String, Codable, Sendable {
        case verified
        case common
    }

    let id: String
    let title: String
    let value: String
    let description: String
    let category: ReferenceCategory
    let kind: Kind
    let tags: [String]
    let confidence: Confidence

    init(
        id: String,
        title: String,
        value: String,
        description: String,
        category: ReferenceCategory,
        kind: Kind,
        tags: [String] = [],
        confidence: Confidence = .verified
    ) {
        self.id = id
        self.title = title
        self.value = value
        self.description = description
        self.category = category
        self.kind = kind
        self.tags = tags
        self.confidence = confidence
    }
}
