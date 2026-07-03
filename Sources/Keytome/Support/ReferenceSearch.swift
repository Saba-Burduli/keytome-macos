import Foundation

enum ReferenceSearch {
    static func filter(
        _ items: [ReferenceItem],
        query: String,
        category: ReferenceCategory?
    ) -> [ReferenceItem] {
        let scoped = items.filter { category == nil || $0.category == category }
        let tokens = query
            .folding(options: [.caseInsensitive, .diacriticInsensitive], locale: .current)
            .lowercased()
            .split(whereSeparator: \.isWhitespace)
            .map(String.init)

        guard !tokens.isEmpty else { return scoped }

        return scoped.filter { item in
            let searchable = [
                item.title,
                item.value,
                item.description,
                item.category.rawValue,
                item.tags.joined(separator: " ")
            ]
            .joined(separator: " ")
            .folding(options: [.caseInsensitive, .diacriticInsensitive], locale: .current)
            .lowercased()

            return tokens.allSatisfy { token in
                searchable.contains(token) || isSubsequence(token, of: searchable)
            }
        }
    }

    private static func isSubsequence(_ query: String, of text: String) -> Bool {
        var queryIndex = query.startIndex
        for character in text where queryIndex < query.endIndex {
            if character == query[queryIndex] {
                query.formIndex(after: &queryIndex)
            }
        }
        return queryIndex == query.endIndex
    }
}
