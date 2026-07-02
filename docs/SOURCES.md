# Reference sources

The bundled KeyForge data was reviewed against primary documentation on July 2, 2026. The app intentionally curates high-frequency engineering and technical workflows instead of reproducing every documented shortcut or command.

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

No complete, public, official Dia keyboard-shortcut reference was discoverable during this review. KeyForge therefore retains only a small set of conventional browser shortcuts, marks every Dia entry as `COMMON`, and tells users to verify them against the installed Dia version. Community reports and assumptions were not promoted to verified data.

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

The Vim/Nvim pack is limited to default, broadly applicable motions, modes, search, editing, yank, paste, undo, and help commands. KeyForge itself mirrors the relevant navigation model while keeping application-specific actions explicit.

## Maintenance policy

- Prefer vendor or project documentation over community lists.
- Keep version-dependent or unverified entries visibly marked.
- Use stable entry IDs so future data updates do not break selection or favorites.
- Re-review sources before releases that materially expand a pack.
