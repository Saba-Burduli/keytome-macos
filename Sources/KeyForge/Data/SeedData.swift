import Foundation

enum SeedData {
    static let items: [ReferenceItem] = macOS + chrome + firefox + dia + brave + terminal + homebrew + zsh

    private static func shortcut(
        _ id: String,
        _ title: String,
        _ value: String,
        _ description: String,
        _ category: ReferenceCategory,
        tags: [String] = [],
        confidence: ReferenceItem.Confidence = .verified
    ) -> ReferenceItem {
        ReferenceItem(
            id: id,
            title: title,
            value: value,
            description: description,
            category: category,
            kind: .shortcut,
            tags: tags,
            confidence: confidence
        )
    }

    private static func command(
        _ id: String,
        _ title: String,
        _ value: String,
        _ description: String,
        _ category: ReferenceCategory,
        tags: [String] = []
    ) -> ReferenceItem {
        ReferenceItem(
            id: id,
            title: title,
            value: value,
            description: description,
            category: category,
            kind: .command,
            tags: tags
        )
    }

    static let macOS: [ReferenceItem] = [
        shortcut("macos-spotlight", "Open Spotlight", "⌘ Space", "Search apps, files, and actions.", .macOS, tags: ["search"]),
        shortcut("macos-switch-apps", "Switch apps", "⌘ Tab", "Move between open applications.", .macOS, tags: ["apps"]),
        shortcut("macos-quit", "Quit app", "⌘ Q", "Quit the active application.", .macOS),
        shortcut("macos-close", "Close window", "⌘ W", "Close the active window.", .macOS),
        shortcut("macos-hide", "Hide current app", "⌘ H", "Hide all windows for the active app.", .macOS),
        shortcut("macos-force-quit", "Force Quit", "⌘ ⌥ Esc", "Open the Force Quit Applications window.", .macOS, tags: ["system"]),
        shortcut("macos-screenshot", "Capture screen", "⌘ ⇧ 5", "Open screenshot and screen recording tools.", .macOS, tags: ["screen", "recording"]),
        shortcut("macos-settings", "Open app settings", "⌘ ,", "Open settings for the active application.", .macOS, tags: ["preferences"]),
        shortcut("macos-minimize", "Minimize window", "⌘ M", "Minimize the active window to the Dock.", .macOS),
        shortcut("macos-lock", "Lock screen", "⌘ ⌃ Q", "Lock the Mac immediately.", .macOS, tags: ["security"])
    ]

    static let chrome: [ReferenceItem] = browserShortcuts(category: .chrome, includeHardReload: true, includePrivateWindow: false)
    static let firefox: [ReferenceItem] = browserShortcuts(category: .firefox, includeHardReload: false, includePrivateWindow: false)
    static let brave: [ReferenceItem] = browserShortcuts(category: .brave, includeHardReload: false, includePrivateWindow: true)

    static let dia: [ReferenceItem] = [
        shortcut("dia-address", "Focus address bar", "⌘ L", "Common browser shortcut; verify against your installed Dia version.", .dia, tags: ["common browser shortcut"], confidence: .common),
        shortcut("dia-new-tab", "New tab", "⌘ T", "Common browser shortcut; verify against your installed Dia version.", .dia, tags: ["common browser shortcut"], confidence: .common),
        shortcut("dia-close-tab", "Close tab", "⌘ W", "Common browser shortcut; verify against your installed Dia version.", .dia, tags: ["common browser shortcut"], confidence: .common),
        shortcut("dia-find", "Find in page", "⌘ F", "Common browser shortcut; verify against your installed Dia version.", .dia, tags: ["common browser shortcut"], confidence: .common)
    ]

    static let terminal: [ReferenceItem] = [
        shortcut("terminal-line-start", "Beginning of line", "⌃ A", "Move the cursor to the beginning of the current line.", .terminal, tags: ["shell", "readline"]),
        shortcut("terminal-line-end", "End of line", "⌃ E", "Move the cursor to the end of the current line.", .terminal, tags: ["shell", "readline"]),
        shortcut("terminal-delete-before", "Delete before cursor", "⌃ U", "Delete from the cursor to the beginning of the line.", .terminal, tags: ["shell"]),
        shortcut("terminal-delete-after", "Delete after cursor", "⌃ K", "Delete from the cursor to the end of the line.", .terminal, tags: ["shell"]),
        shortcut("terminal-delete-word", "Delete previous word", "⌃ W", "Delete the word immediately before the cursor.", .terminal, tags: ["shell"]),
        shortcut("terminal-interrupt", "Interrupt command", "⌃ C", "Send an interrupt signal to the foreground process.", .terminal, tags: ["signal"]),
        shortcut("terminal-eof", "End input or exit", "⌃ D", "Send end-of-input; an idle shell commonly exits.", .terminal, tags: ["shell"]),
        shortcut("terminal-clear", "Clear screen", "⌃ L", "Clear the visible terminal screen.", .terminal),
        shortcut("terminal-new-tab", "New terminal tab", "⌘ T", "Open a new tab in Terminal.", .terminal, tags: ["Terminal.app"]),
        shortcut("terminal-new-window", "New terminal window", "⌘ N", "Open a new Terminal window.", .terminal, tags: ["Terminal.app"])
    ]

    static let homebrew: [ReferenceItem] = [
        command("brew-install", "Install package", "brew install <package>", "Install a formula or cask.", .homebrew),
        command("brew-uninstall", "Uninstall package", "brew uninstall <package>", "Remove an installed formula or cask.", .homebrew),
        command("brew-update", "Update Homebrew", "brew update", "Fetch the newest Homebrew and formula metadata.", .homebrew),
        command("brew-upgrade", "Upgrade packages", "brew upgrade", "Upgrade outdated installed packages.", .homebrew),
        command("brew-search", "Search packages", "brew search <package>", "Search available formulae and casks.", .homebrew),
        command("brew-info", "Show package info", "brew info <package>", "Display package details and install status.", .homebrew),
        command("brew-list", "List installed packages", "brew list", "List installed formulae and casks.", .homebrew),
        command("brew-cleanup", "Clean old packages", "brew cleanup", "Remove stale downloads and old package versions.", .homebrew),
        command("brew-doctor", "Diagnose Homebrew", "brew doctor", "Check the Homebrew environment for common problems.", .homebrew),
        command("brew-service-start", "Start service", "brew services start <service>", "Start and register a background service.", .homebrew, tags: ["services"]),
        command("brew-service-stop", "Stop service", "brew services stop <service>", "Stop and unregister a background service.", .homebrew, tags: ["services"]),
        command("brew-service-restart", "Restart service", "brew services restart <service>", "Restart a Homebrew-managed service.", .homebrew, tags: ["services"])
    ]

    static let zsh: [ReferenceItem] = [
        command("zsh-cd", "Change directory", "cd <directory>", "Move into another directory.", .zsh),
        command("zsh-pwd", "Print directory", "pwd", "Show the current working directory.", .zsh),
        command("zsh-ls", "List all files", "ls -la", "List files with details, including hidden files.", .zsh),
        command("zsh-mkdir", "Create directory", "mkdir <directory>", "Create a new directory.", .zsh),
        command("zsh-touch", "Create file", "touch <file>", "Create an empty file or update its timestamp.", .zsh),
        command("zsh-rm", "Remove file", "rm <file>", "Permanently remove a file.", .zsh, tags: ["destructive"]),
        command("zsh-rm-rf", "Remove directory recursively", "rm -rf <directory>", "Permanently remove a directory and its contents.", .zsh, tags: ["destructive"]),
        command("zsh-cp", "Copy", "cp <source> <destination>", "Copy a file or directory.", .zsh),
        command("zsh-mv", "Move or rename", "mv <source> <destination>", "Move or rename a file or directory.", .zsh),
        command("zsh-cat", "Print file", "cat <file>", "Write a file's contents to standard output.", .zsh),
        command("zsh-grep", "Search file text", "grep \"<text>\" <file>", "Find matching text in a file.", .zsh, tags: ["search"]),
        command("zsh-history", "Show command history", "history", "Print recent shell commands.", .zsh),
        command("zsh-clear", "Clear terminal", "clear", "Clear the terminal display.", .zsh),
        command("zsh-source", "Reload zsh config", "source ~/.zshrc", "Apply changes from the zsh configuration file.", .zsh, tags: ["config"]),
        command("zsh-edit-config", "Edit zsh config", "nano ~/.zshrc", "Open the zsh configuration file in nano.", .zsh, tags: ["config"]),
        command("zsh-path", "Show PATH", "echo $PATH", "Print the executable search path.", .zsh, tags: ["environment"]),
        command("zsh-which", "Locate command", "which <command>", "Show which executable the shell resolves.", .zsh)
    ]

    private static func browserShortcuts(
        category: ReferenceCategory,
        includeHardReload: Bool,
        includePrivateWindow: Bool
    ) -> [ReferenceItem] {
        let prefix = category.rawValue.lowercased()
        var result = [
            shortcut("\(prefix)-address", "Focus address bar", "⌘ L", "Move focus to the address bar.", category),
            shortcut("\(prefix)-new-tab", "New tab", "⌘ T", "Open a new browser tab.", category),
            shortcut("\(prefix)-close-tab", "Close tab", "⌘ W", "Close the active browser tab.", category),
            shortcut("\(prefix)-reopen-tab", "Reopen closed tab", "⌘ ⇧ T", "Restore the most recently closed tab.", category),
            shortcut("\(prefix)-switch-tabs", "Switch tabs", "⌘ ⌥ ← / →", "Move to the previous or next tab.", category),
            shortcut("\(prefix)-reload", "Reload page", "⌘ R", "Reload the current page.", category),
            shortcut("\(prefix)-find", "Find in page", "⌘ F", "Search text on the current page.", category),
            shortcut("\(prefix)-bookmark", "Bookmark page", "⌘ D", "Bookmark the current page.", category)
        ]
        if includeHardReload {
            result.append(shortcut("\(prefix)-hard-reload", "Hard reload", "⌘ ⇧ R", "Reload while bypassing cached content.", category))
        }
        if includePrivateWindow {
            result.append(shortcut("\(prefix)-private-window", "New private window", "⌘ ⇧ N", "Open a private browsing window.", category, tags: ["privacy"]))
        }
        return result
    }
}
