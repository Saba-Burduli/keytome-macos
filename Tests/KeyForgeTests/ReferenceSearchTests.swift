import Testing
@testable import KeyForge

struct ReferenceSearchTests {
    private let items = ReferenceRepository().items

    @Test func emptyQueryReturnsCategoryItems() {
        let results = ReferenceSearch.filter(items, query: "", category: .homebrew)

        #expect(!results.isEmpty)
        #expect(results.allSatisfy { $0.category == .homebrew })
    }

    @Test func searchIsCaseInsensitiveAcrossFields() {
        let results = ReferenceSearch.filter(items, query: "SPOTLIGHT", category: nil)

        #expect(results.map(\.id).contains("macos-spotlight"))
    }

    @Test func searchMatchesCommandsAndTags() {
        let commandResults = ReferenceSearch.filter(items, query: "brew doctor", category: nil)
        let tagResults = ReferenceSearch.filter(items, query: "destructive", category: .zsh)

        #expect(commandResults.map(\.id).contains("brew-doctor"))
        #expect(tagResults.count == 2)
    }

    @Test func fuzzySubsequenceMatchesCompactQuery() {
        let results = ReferenceSearch.filter(items, query: "rctb", category: .chrome)

        #expect(results.map(\.id).contains("chrome-reopen-tab"))
    }

    @Test func categoryScopeExcludesOtherPacks() {
        let results = ReferenceSearch.filter(items, query: "new tab", category: .firefox)

        #expect(results.count == 1)
        #expect(results.first?.category == .firefox)
    }
}
