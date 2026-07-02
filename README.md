# KeyForge

KeyForge is a native, offline macOS reference app for system shortcuts, browser shortcuts, Terminal keys, Homebrew commands, and everyday zsh commands. It is designed as a fast, keyboard-first developer utility with a restrained terminal-inspired interface.

## Screenshot

> Screenshot placeholder — add `docs/keyforge-main.png` after the first tagged release.

## Features

- Native SwiftUI interface for macOS 14 and newer
- Nine bundled reference packs: macOS, Chrome, Firefox, Dia, Brave, Terminal, Homebrew, zsh, and Vim/Nvim
- Fast case-insensitive search with compact fuzzy-subsequence matching
- Category filtering and result counts
- One-click copy for every shortcut and command
- Neovim-style controls: `j/k` moves, `h/l` switches packs, `gg/G` jumps, `/` searches, `y` copies, `:` opens command mode, and `Esc` returns to NORMAL
- Command palette support for `:search`, `:open`, `:next`, `:prev`, `:clear`, and `:help`
- Resizable sidebar-detail layout with an empty-results state
- Fully local data with no account, backend, telemetry, or network requirement
- Curated from primary vendor documentation, recorded in [`docs/SOURCES.md`](docs/SOURCES.md)

Dia entries are intentionally limited to common browser conventions and are visibly marked `COMMON`. They should not be treated as Dia-specific verified documentation.

## Tech stack

- Swift 6
- SwiftUI and AppKit pasteboard integration
- Swift Package Manager
- Swift Testing
- GitHub Actions on `macos-latest`

## Project structure

```text
Sources/KeyForge/
├── App/          App entry point
├── Components/   Reusable search, row, and copy controls
├── Data/         Repository and bundled seed data
├── Models/       Reference item and category types
├── Support/      Theme, search, and pasteboard helpers
└── Views/        Sidebar, content, list, header, footer, and empty state
Tests/KeyForgeTests/
script/build_and_run.sh
```

## Run locally

Requirements: macOS 14 or newer and Xcode 16 or a compatible Swift 6 toolchain.

```bash
git clone <repository-url>
cd keyforge-macos
./script/build_and_run.sh
```

The script builds the Swift package, stages `dist/KeyForge.app`, and launches it as a normal macOS application. Use `./script/build_and_run.sh --verify` to also confirm that the app process started.

For development validation:

```bash
swift test
```

## Add a shortcut pack

1. Add a case and SF Symbol mapping in `Sources/KeyForge/Models/ReferenceCategory.swift`.
2. Add typed `ReferenceItem` values in `Sources/KeyForge/Data/SeedData.swift`.
3. Include the new array in `SeedData.items`.
4. Add search or data-integrity tests when the pack introduces new behavior.

Each entry has a stable ID, title, copyable value, description, category, kind, tags, and confidence level. Use `.common` for plausible but not independently verified shortcuts so the UI communicates uncertainty.

When updating bundled entries, use the primary sources and maintenance policy in [`docs/SOURCES.md`](docs/SOURCES.md). Do not promote community-reported shortcuts to verified data without vendor documentation.

## Roadmap

- User-importable local JSON packs
- Configurable key display styles and user-defined mappings
- Favorites and recently copied entries
- Verified Dia-specific reference pack
- Signed and notarized release builds

## License

No open-source license has been selected yet. All rights are reserved until a license file is added.
