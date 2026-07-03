# Reference sources

The bundled Keytome data was reviewed against primary documentation on July 4, 2026. The app intentionally curates high-frequency engineering and technical workflows instead of reproducing every documented shortcut or command.

## macOS and Terminal

- [Mac keyboard shortcuts — Apple Support](https://support.apple.com/en-us/102650)
- [Keyboard shortcuts in Terminal on Mac — Terminal User Guide](https://support.apple.com/guide/terminal/trmlshtcts/mac)

The macOS pack prioritizes window management, Finder navigation, paths, hidden files, screenshots, search, and text editing. The Terminal pack combines Terminal.app window shortcuts from Apple with standard interactive shell control keys.

## Browsers

- [Chrome keyboard shortcuts — Google Chrome Help](https://support.google.com/chrome/answer/157179?co=GENIE.Platform%3DDesktop&hl=en)
- [Firefox keyboard shortcuts — Mozilla Support](https://support.mozilla.org/en-US/kb/keyboard-shortcuts-perform-firefox-tasks-quickly)
- [Brave keyboard shortcuts — Brave Help Center](https://support.brave.com/hc/en-us/articles/360032272171-What-keyboard-shortcuts-can-I-use-in-Brave)

The browser packs prioritize tab and window control, navigation, search, cache-bypass reloads, history, downloads, privacy controls, and developer tools.

### Dia limitation

No complete, public, official Dia keyboard-shortcut reference was discoverable during this review. Keytome therefore retains only a small set of conventional browser shortcuts, marks every Dia entry as `COMMON`, and tells users to verify them against the installed Dia version. Community reports and assumptions were not promoted to verified data.

## Homebrew and zsh

- [Homebrew `brew(1)` manual](https://docs.brew.sh/Manpage)
- [Homebrew documentation](https://docs.brew.sh/)
- [The Z Shell Manual](https://zsh.sourceforge.io/Doc/Release/)
- [Zsh shell builtin commands](https://zsh.sourceforge.io/Doc/Release/Shell-Builtin-Commands.html)

The Homebrew pack includes daily package management, diagnostics, dependency inspection, services, cleanup previews, pinning, and reproducible Brewfile workflows. The zsh pack includes navigation, aliases, environment variables, job control, directory stacks, shell options, pipes, conditional execution, and redirection, alongside common command-line utilities used from zsh.

## Vim and Neovim

- [Neovim motion reference](https://neovim.io/doc/user/motion/)
- [Neovim change, yank, and register reference](https://neovim.io/doc/user/change/)
- [Neovim command-line reference](https://neovim.io/doc/user/cmdline/)
- [Neovim user guide: moving around and searching](https://neovim.io/doc/user/usr_03/)

The Vim/Nvim pack is limited to default, broadly applicable motions, modes, search, editing, yank, paste, undo, and help commands. Keytome itself mirrors the relevant navigation model while keeping application-specific actions explicit.

## IDEs

- [JetBrains predefined macOS keymap](https://www.jetbrains.com/help/idea/reference-keymap-mac-default.html)
- [JetBrains Rider predefined keymaps](https://www.jetbrains.com/help/rider/Reference_Keyboard_Shortcuts_Index.html)
- [Visual Studio default keyboard shortcuts](https://learn.microsoft.com/en-us/visualstudio/ide/default-keyboard-shortcuts-in-visual-studio?view=vs-2022)
- [Identify and customize Visual Studio shortcuts](https://learn.microsoft.com/en-us/visualstudio/ide/identifying-and-customizing-keyboard-shortcuts-in-visual-studio?view=vs-2022)
- [Xcode keyboard shortcuts and gestures — Apple archive](https://developer.apple.com/library/archive/documentation/IDEs/Conceptual/xcode_help-command_shortcuts/Introduction/Introduction.html)

The JetBrains pack uses the shared predefined macOS keymap used by IntelliJ-platform IDEs, including IntelliJ IDEA, PyCharm, WebStorm, PhpStorm, CLion, GoLand, Rider, RubyMine, DataGrip, and RustRover. Product-specific plugin actions and customized keymaps are outside its scope.

Visual Studio is a Windows product; its pack records the default General development profile and uses Windows modifier names. Bindings can change with the selected profile, editor context, extensions, and user customization.

The Xcode pack records the default menu key equivalents from the current installed Xcode release and covers file navigation, workspace search, build actions, tests, profiling, and debugging. Xcode bindings remain user-configurable.

## AI coding tools and agent CLIs

- [Cursor keyboard shortcuts](https://docs.cursor.com/advanced/keyboard-shortcuts)
- [GitHub Copilot keyboard shortcuts in VS Code](https://code.visualstudio.com/docs/reference/default-keybindings)
- [Zed key bindings](https://zed.dev/docs/key-bindings)
- [Windsurf Cascade](https://docs.windsurf.com/windsurf/cascade/cascade)
- [Claude Code CLI reference](https://docs.anthropic.com/en/docs/claude-code/cli-usage)
- [OpenAI Codex CLI reference](https://developers.openai.com/codex/cli/reference/)
- [OpenAI Codex slash commands](https://developers.openai.com/codex/cli/slash-commands/)
- [Aider in-chat commands](https://aider.chat/docs/usage/commands.html)
- [Junie CLI shortcuts and slash commands](https://junie.jetbrains.com/docs/slash-commands.html)
- [Cline commands](https://docs.cline.bot/core-workflows/using-commands)
- [Warp keyboard shortcuts](https://docs.warp.dev/getting-started/keyboard-shortcuts)
- [Replit documentation](https://docs.replit.com/)
- [Firebase Studio](https://firebase.google.com/docs/studio)
- [Hermes Agent CLI](https://hermes-agent.nousresearch.com/docs/user-guide/cli)
- [OpenClaw CLI reference](https://docs.openclaw.ai/cli)

Some tools inherit editor defaults or allow complete remapping. Entries without a stable published default are marked `COMMON`; CLI packs favor documented commands over invented key bindings.

## Knowledge and creative tools

- [Obsidian hotkeys](https://help.obsidian.md/hotkeys)
- [Blender default keymap](https://docs.blender.org/manual/en/latest/interface/keymap/blender_default.html)
- [Unity shortcut manager](https://docs.unity3d.com/Manual/ShortcutsManager.html)
- [Unreal Engine keyboard shortcut customization](https://dev.epicgames.com/documentation/en-us/unreal-engine/customizing-keyboard-shortcuts-in-unreal-engine)

Creative-tool packs use their documented default keymaps. macOS symbols are used where the vendor publishes a macOS binding; cross-platform tools may retain Control-based defaults.

## Maintenance policy

- Prefer vendor or project documentation over community lists.
- Keep version-dependent or unverified entries visibly marked.
- Use stable entry IDs so future data updates do not break selection or favorites.
- Re-review sources before releases that materially expand a pack.
