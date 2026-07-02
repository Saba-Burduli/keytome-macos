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
        #expect(tagResults.map(\.id).contains("zsh-rm"))
        #expect(tagResults.map(\.id).contains("zsh-rm-rf"))
    }

    @Test func fuzzySubsequenceMatchesCompactQuery() {
        let results = ReferenceSearch.filter(items, query: "rctb", category: .chrome)

        #expect(results.map(\.id).contains("chrome-reopen-tab"))
    }

    @Test func categoryScopeExcludesOtherPacks() {
        let results = ReferenceSearch.filter(items, query: "new tab", category: .firefox)

        #expect(results.map(\.id).contains("firefox-new-tab"))
        #expect(results.allSatisfy { $0.category == .firefox })
    }

    @Test func seedDataHasStableUniqueIDsAndEveryPackIsSubstantial() {
        let ids = Set(items.map(\.id))

        #expect(ids.count == items.count)
        for category in ReferenceCategory.allCases {
            let minimum = category == .dia ? 4 : 15
            #expect(items.count(where: { $0.category == category }) >= minimum)
        }
    }

    @Test func commandPaletteParsesNavigationAndPackCommands() {
        #expect(PaletteCommand.parse(":next") == .next)
        #expect(PaletteCommand.parse("prev") == .previous)
        #expect(PaletteCommand.parse(":search copy path") == .search("copy path"))
        #expect(PaletteCommand.parse(":open chrome") == .open(.chrome))
        #expect(PaletteCommand.parse(":open vimnvim") == .open(.vimNvim))
        #expect(PaletteCommand.parse(":unknown") == nil)
    }

    @Test func sessionSupportsVimStyleNavigation() {
        let session = KeyForgeSession(items: items)
        let firstID = session.selectedItemID

        session.moveSelection(by: 1)
        #expect(session.selectedItemID != firstID)
        session.moveToBoundary(first: false)
        #expect(session.selectedItemID == session.visibleItems.last?.id)
        session.switchCategory(by: 1)
        #expect(session.category == .chrome)
    }
}
