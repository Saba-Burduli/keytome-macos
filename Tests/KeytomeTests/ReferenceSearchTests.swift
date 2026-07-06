import Testing
@testable import Keytome

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
        #expect(PaletteCommand.parse(":s") == .search(""))
        #expect(PaletteCommand.parse(":o all") == .open(nil))
        #expect(PaletteCommand.parse(":open homebrew") == .open(.homebrew))
        #expect(PaletteCommand.parse(":open jetbrains") == .open(.jetBrains))
        #expect(PaletteCommand.parse(":open visualstudio") == .open(.visualStudio))
        #expect(PaletteCommand.parse(":open xcode") == .open(.xcode))
        #expect(PaletteCommand.parse(":open copilot") == .open(.githubCopilot))
        #expect(PaletteCommand.parse(":open zedagent") == .open(.zedAgent))
        #expect(PaletteCommand.parse(":open codex") == .open(.openAICodex))
        #expect(PaletteCommand.parse(":open codexapp") == .open(.codexApp))
        #expect(PaletteCommand.parse(":open hermes") == .open(.hermesAgent))
        #expect(PaletteCommand.parse(":open unreal") == .open(.unrealEngine))
        #expect(PaletteCommand.parse(":clear") == .clear)
        #expect(PaletteCommand.parse(":help") == .help)
        #expect(PaletteCommand.parse(":open") == nil)
        #expect(PaletteCommand.parse("   ") == nil)
    }

    @Test func extendedPacksContainRepresentativeVerifiedActions() {
        let expected: [ReferenceCategory: String] = [
            .cursor: "cursor-agent", .githubCopilot: "copilot-chat", .zed: "zed-palette",
            .zedAgent: "zed-agent-context", .windsurf: "windsurf-cascade", .claudeCode: "claude-start",
            .openAICodex: "codex-start", .aider: "aider-add", .junie: "junie-plan",
            .cline: "cline-newtask", .warp: "warp-palette", .replit: "replit-run",
            .firebaseStudio: "firebase-palette", .obsidian: "obsidian-palette", .codexApp: "codexapp-new",
            .hermesAgent: "hermes-0", .openClaw: "openclaw-0", .blender: "blender-search",
            .unity: "unity-play", .unrealEngine: "unreal-content"
        ]

        for (category, id) in expected {
            #expect(items.contains(where: { $0.category == category && $0.id == id }))
        }
    }

    @Test func idePacksContainCuratedDefaultKeymaps() {
        #expect(items.count(where: { $0.category == .jetBrains }) >= 30)
        #expect(items.count(where: { $0.category == .visualStudio }) >= 30)
        #expect(items.count(where: { $0.category == .xcode }) >= 30)
        #expect(items.first(where: { $0.id == "jetbrains-search-everywhere" })?.value == "⇧ ⇧")
        #expect(items.first(where: { $0.id == "vs-build-solution" })?.value == "Ctrl+Shift+B")
        #expect(items.first(where: { $0.id == "xcode-build" })?.value == "⌘ B")
    }

    @Test func sessionSupportsVimStyleNavigation() {
        let session = KeytomeSession(items: items)
        let firstID = session.selectedItemID

        session.moveSelection(by: 1)
        #expect(session.selectedItemID != firstID)
        session.moveToBoundary(first: false)
        #expect(session.selectedItemID == session.visibleItems.last?.id)
        session.switchCategory(by: 1)
        #expect(session.category == .chrome)
    }

    @Test func selectionStopsAtNavigationBoundaries() {
        let session = KeytomeSession(items: items)
        session.moveToBoundary(first: true)
        let first = session.selectedItemID
        session.moveSelection(by: -1)
        #expect(session.selectedItemID == first)

        session.moveToBoundary(first: false)
        let last = session.selectedItemID
        session.moveSelection(by: 1)
        #expect(session.selectedItemID == last)
    }

    @Test func categorySwitchingStopsAtBoundariesAndVisitsEveryPack() {
        let session = KeytomeSession(items: items)
        session.selectCategory(nil)
        session.switchCategory(by: -1)
        #expect(session.category == nil)

        for category in ReferenceCategory.allCases {
            session.switchCategory(by: 1)
            #expect(session.category == category)
            #expect(session.visibleItems.allSatisfy { $0.category == category })
        }
        session.switchCategory(by: 1)
        #expect(session.category == ReferenceCategory.allCases.last)
    }

    @Test func searchAndModeTransitionsNormalizeState() {
        let session = KeytomeSession(items: items)
        session.beginSearch()
        #expect(session.mode == .search)
        session.query = "no result can match this phrase"
        session.updateSearch()
        #expect(session.visibleItems.isEmpty)
        #expect(session.selectedItemID == nil)

        session.beginCommand()
        #expect(session.mode == .command)
        session.commandText = ":clear"
        #expect(session.executeCommand())
        #expect(session.mode == .normal)
        #expect(session.query.isEmpty)
        #expect(session.selectedItemID == session.visibleItems.first?.id)
    }

    @Test func everyPaletteCommandExecutesAndInvalidCommandStaysInCommandMode() {
        let session = KeytomeSession(items: items)

        session.beginCommand()
        session.commandText = ":invalid"
        #expect(!session.executeCommand())
        #expect(session.mode == .command)

        session.commandText = ":search spotlight"
        #expect(session.executeCommand())
        #expect(session.query == "spotlight")

        session.beginCommand()
        session.commandText = ":open Chrome"
        #expect(session.executeCommand())
        #expect(session.category == .chrome)

        let initial = session.selectedItemID
        session.beginCommand()
        session.commandText = ":next"
        #expect(session.executeCommand())
        #expect(session.selectedItemID != initial)

        session.beginCommand()
        session.commandText = ":prev"
        #expect(session.executeCommand())
        #expect(session.selectedItemID == initial)

        session.beginCommand()
        session.commandText = ":help"
        #expect(session.executeCommand())
        #expect(session.showsHelp)
    }

    @Test func shortcutChordNormalizesModifiersAndSequences() {
        #expect(ShortcutChord("Ctrl+Shift+B").strokes == [.init(keys: ["⌃", "⇧", "B"])])
        #expect(ShortcutChord("⌘ K ⌘ S").strokes == [
            .init(keys: ["⌘", "K"]),
            .init(keys: ["⌘", "S"])
        ])
        #expect(ShortcutChord("Tab").strokes == [.init(keys: ["Tab"])])
    }

    @Test func groupsFilterWithoutChangingTheSelectedPack() {
        let session = KeytomeSession(items: items)
        session.selectCategory(.vimNvim)
        let navigation = session.availableGroups.first(where: { $0.id == "navigation" })

        #expect(navigation != nil)
        session.selectGroup(navigation)
        #expect(session.category == .vimNvim)
        #expect(!session.visibleItems.isEmpty)
        #expect(session.visibleItems.allSatisfy { ReferenceGroup.resolve($0) == navigation })

        session.selectCategory(.chrome)
        #expect(session.selectedGroup == nil)
    }

    @Test func everyPackHasPresentationAndGroups() {
        for category in ReferenceCategory.allCases {
            let style = PackVisualStyle(category: category)
            let packItems = items.filter { $0.category == category }

            #expect(!style.label.isEmpty)
            #expect(!ReferenceGroup.available(in: packItems).isEmpty)
        }
    }
}
