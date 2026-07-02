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
        shortcut("macos-lock", "Lock screen", "⌘ ⌃ Q", "Lock the Mac immediately.", .macOS, tags: ["security"]),
        shortcut("macos-app-windows", "Switch app windows", "⌘ `", "Move through windows belonging to the active app.", .macOS, tags: ["windows"]),
        shortcut("macos-full-screen", "Toggle full screen", "⌘ ⌃ F", "Enter or leave full-screen mode in supported apps.", .macOS, tags: ["windows"]),
        shortcut("macos-quick-look", "Quick Look", "Space", "Preview the selected Finder item without opening it.", .macOS, tags: ["Finder", "preview"]),
        shortcut("macos-finder-folder", "New Finder folder", "⌘ ⇧ N", "Create a new folder in Finder.", .macOS, tags: ["Finder"]),
        shortcut("macos-go-folder", "Go to folder", "⌘ ⇧ G", "Open Finder's Go to Folder sheet and enter a path.", .macOS, tags: ["Finder", "path"]),
        shortcut("macos-hidden-files", "Toggle hidden files", "⌘ ⇧ .", "Show or hide hidden files in Finder and file dialogs.", .macOS, tags: ["Finder", "dotfiles"]),
        shortcut("macos-copy-path", "Copy file pathname", "⌘ ⌥ C", "Copy the full pathname of selected Finder items.", .macOS, tags: ["Finder", "path"]),
        shortcut("macos-emoji", "Character Viewer", "⌘ ⌃ Space", "Open emoji, symbols, and special characters.", .macOS, tags: ["symbols"]),
        shortcut("macos-forward-delete", "Forward delete", "Fn Delete", "Delete the character to the right of the insertion point.", .macOS, tags: ["editing"]),
        shortcut("macos-delete-word", "Delete previous word", "⌥ Delete", "Delete the word to the left of the insertion point.", .macOS, tags: ["editing"])
    ]

    static let chrome: [ReferenceItem] = browserShortcuts(category: .chrome)
    static let firefox: [ReferenceItem] = browserShortcuts(category: .firefox)
    static let brave: [ReferenceItem] = browserShortcuts(category: .brave)

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
        shortcut("terminal-new-window", "New terminal window", "⌘ N", "Open a new Terminal window.", .terminal, tags: ["Terminal.app"]),
        shortcut("terminal-new-tab-same", "New tab with same command", "⌘ ⌃ T", "Open a tab running the same command as the active terminal.", .terminal, tags: ["Terminal.app"]),
        shortcut("terminal-new-window-same", "New window with same command", "⌘ ⌃ N", "Open a window running the same command as the active terminal.", .terminal, tags: ["Terminal.app"]),
        shortcut("terminal-show-tab-bar", "Toggle tab bar", "⌘ ⇧ T", "Show or hide Terminal's tab bar.", .terminal, tags: ["Terminal.app"]),
        shortcut("terminal-word-forward", "Move forward one word", "⌥ →", "Move the insertion point forward by one word.", .terminal, tags: ["editing"]),
        shortcut("terminal-word-backward", "Move backward one word", "⌥ ←", "Move the insertion point backward by one word.", .terminal, tags: ["editing"]),
        shortcut("terminal-transpose", "Transpose characters", "⌃ T", "Swap the two characters around the insertion point.", .terminal, tags: ["editing"]),
        shortcut("terminal-find", "Find terminal text", "⌘ F", "Search text in the active Terminal window.", .terminal, tags: ["search"]),
        shortcut("terminal-find-next", "Find next match", "⌘ G", "Move to the next terminal search result.", .terminal, tags: ["search"]),
        shortcut("terminal-find-previous", "Find previous match", "⌘ ⇧ G", "Move to the previous terminal search result.", .terminal, tags: ["search"]),
        shortcut("terminal-clear-scrollback", "Clear scrollback", "⌘ K", "Clear the Terminal window's scrollback buffer.", .terminal, tags: ["Terminal.app"]),
        shortcut("terminal-inspector", "Show inspector", "⌘ I", "Show Terminal's inspector for the selected tab.", .terminal, tags: ["profile"]),
        shortcut("terminal-next-tab", "Next tab", "⌘ ⇧ ]", "Select the next Terminal tab.", .terminal, tags: ["tabs"]),
        shortcut("terminal-previous-tab", "Previous tab", "⌘ ⇧ [", "Select the previous Terminal tab.", .terminal, tags: ["tabs"])
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
        command("brew-cleanup-dry-run", "Preview cleanup", "brew cleanup --dry-run", "Show what cleanup would remove without deleting it.", .homebrew, tags: ["safe preview"]),
        command("brew-doctor", "Diagnose Homebrew", "brew doctor", "Check the Homebrew environment for common problems.", .homebrew),
        command("brew-outdated", "List outdated packages", "brew outdated", "Show installed formulae and casks with available upgrades.", .homebrew),
        command("brew-upgrade-one", "Upgrade one package", "brew upgrade <package>", "Upgrade a specific installed package.", .homebrew),
        command("brew-reinstall", "Reinstall package", "brew reinstall <package>", "Uninstall and install a package again using its current options.", .homebrew),
        command("brew-autoremove", "Remove unused dependencies", "brew autoremove", "Remove formulae installed only as dependencies that are no longer needed.", .homebrew),
        command("brew-deps", "Show dependencies", "brew deps --tree <package>", "Display a package dependency tree.", .homebrew, tags: ["diagnostics"]),
        command("brew-uses", "Show dependents", "brew uses --installed <package>", "List installed packages that depend on a package.", .homebrew, tags: ["diagnostics"]),
        command("brew-leaves", "List top-level formulae", "brew leaves", "List installed formulae that are not dependencies of another installed formula.", .homebrew),
        command("brew-pin", "Pin package", "brew pin <package>", "Prevent a formula from being upgraded.", .homebrew),
        command("brew-unpin", "Unpin package", "brew unpin <package>", "Allow a pinned formula to be upgraded again.", .homebrew),
        command("brew-config", "Show configuration", "brew config", "Print Homebrew and system configuration for diagnostics.", .homebrew, tags: ["diagnostics"]),
        command("brew-bundle-dump", "Create Brewfile", "brew bundle dump --force", "Write the installed package state to a Brewfile.", .homebrew, tags: ["Brewfile", "reproducible"]),
        command("brew-bundle-install", "Restore Brewfile", "brew bundle install", "Install and upgrade dependencies declared in a Brewfile.", .homebrew, tags: ["Brewfile", "reproducible"]),
        command("brew-bundle-check", "Check Brewfile", "brew bundle check", "Verify that Brewfile dependencies are installed and current.", .homebrew, tags: ["Brewfile", "CI"]),
        command("brew-service-start", "Start service", "brew services start <service>", "Start and register a background service.", .homebrew, tags: ["services"]),
        command("brew-service-stop", "Stop service", "brew services stop <service>", "Stop and unregister a background service.", .homebrew, tags: ["services"]),
        command("brew-service-restart", "Restart service", "brew services restart <service>", "Restart a Homebrew-managed service.", .homebrew, tags: ["services"]),
        command("brew-service-list", "List services", "brew services list", "Show the state of Homebrew-managed services.", .homebrew, tags: ["services"]),
        command("brew-service-info", "Inspect service", "brew services info <service>", "Show detailed status for a Homebrew-managed service.", .homebrew, tags: ["services", "diagnostics"])
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
        command("zsh-which", "Locate command", "which <command>", "Show which executable the shell resolves.", .zsh),
        command("zsh-type", "Explain command resolution", "type <command>", "Report whether a name resolves to an alias, function, builtin, or executable.", .zsh, tags: ["diagnostics"]),
        command("zsh-alias", "Create session alias", "alias name='command'", "Define an alias for the current shell session.", .zsh, tags: ["alias"]),
        command("zsh-alias-list", "List aliases", "alias", "Print all currently defined aliases.", .zsh, tags: ["alias"]),
        command("zsh-unalias", "Remove alias", "unalias <name>", "Remove an alias from the current shell session.", .zsh, tags: ["alias"]),
        command("zsh-export", "Export environment variable", "export NAME='value'", "Set a variable and export it to child processes.", .zsh, tags: ["environment"]),
        command("zsh-unset", "Unset variable", "unset <name>", "Remove a shell variable or environment variable.", .zsh, tags: ["environment"]),
        command("zsh-jobs", "List background jobs", "jobs -l", "List jobs managed by the current shell with process IDs.", .zsh, tags: ["process", "job control"]),
        command("zsh-background", "Resume job in background", "bg %<job>", "Resume a suspended shell job in the background.", .zsh, tags: ["process", "job control"]),
        command("zsh-foreground", "Bring job to foreground", "fg %<job>", "Resume a shell job in the foreground.", .zsh, tags: ["process", "job control"]),
        command("zsh-suspend", "Suspend foreground job", "Ctrl+Z", "Suspend the current foreground process, then use bg or fg.", .zsh, tags: ["process", "job control"]),
        command("zsh-pushd", "Push directory", "pushd <directory>", "Change directory and add it to the directory stack.", .zsh, tags: ["navigation", "directory stack"]),
        command("zsh-popd", "Pop directory", "popd", "Return to the next directory on the directory stack.", .zsh, tags: ["navigation", "directory stack"]),
        command("zsh-dirs", "Show directory stack", "dirs -v", "List directory-stack entries with numeric positions.", .zsh, tags: ["navigation", "directory stack"]),
        command("zsh-pipe", "Pipe command output", "<command> | <command>", "Send one command's standard output to another command.", .zsh, tags: ["composition", "stdout"]),
        command("zsh-redirect", "Redirect output", "<command> > <file>", "Write standard output to a file, replacing its contents.", .zsh, tags: ["redirection", "stdout"]),
        command("zsh-append", "Append output", "<command> >> <file>", "Append standard output to a file.", .zsh, tags: ["redirection", "stdout"]),
        command("zsh-stderr", "Redirect errors", "<command> 2> <file>", "Write standard error to a file.", .zsh, tags: ["redirection", "stderr"]),
        command("zsh-and", "Run after success", "<command> && <command>", "Run the second command only when the first succeeds.", .zsh, tags: ["composition", "conditional"]),
        command("zsh-or", "Run after failure", "<command> || <command>", "Run the second command only when the first fails.", .zsh, tags: ["composition", "conditional"]),
        command("zsh-setopt", "Enable zsh option", "setopt <option>", "Enable a zsh behavior option for the current shell.", .zsh, tags: ["config"]),
        command("zsh-unsetopt", "Disable zsh option", "unsetopt <option>", "Disable a zsh behavior option for the current shell.", .zsh, tags: ["config"]),
        command("zsh-shell-options", "List zsh options", "setopt", "List zsh options enabled in the current shell.", .zsh, tags: ["config", "diagnostics"])
    ]

    private static func browserShortcuts(category: ReferenceCategory) -> [ReferenceItem] {
        let prefix = category.rawValue.lowercased()
        var result = [
            shortcut("\(prefix)-address", "Focus address bar", "⌘ L", "Move focus to the address bar.", category),
            shortcut("\(prefix)-new-tab", "New tab", "⌘ T", "Open a new browser tab.", category),
            shortcut("\(prefix)-close-tab", "Close tab", "⌘ W", "Close the active browser tab.", category),
            shortcut("\(prefix)-reopen-tab", "Reopen closed tab", "⌘ ⇧ T", "Restore the most recently closed tab.", category),
            shortcut("\(prefix)-switch-tabs", "Switch tabs", "⌘ ⌥ ← / →", "Move to the previous or next tab.", category),
            shortcut("\(prefix)-tab-number", "Jump to tab 1–8", "⌘ 1…8", "Select a tab directly by its position.", category, tags: ["tabs"]),
            shortcut("\(prefix)-last-tab", "Jump to last tab", "⌘ 9", "Select the last open tab.", category, tags: ["tabs"]),
            shortcut("\(prefix)-new-window", "New window", "⌘ N", "Open a new browser window.", category),
            shortcut("\(prefix)-reload", "Reload page", "⌘ R", "Reload the current page.", category),
            shortcut("\(prefix)-hard-reload", "Reload without cache", "⌘ ⇧ R", "Reload the page while bypassing cached content.", category, tags: ["developer", "cache"]),
            shortcut("\(prefix)-find", "Find in page", "⌘ F", "Search text on the current page.", category),
            shortcut("\(prefix)-find-next", "Next find match", "⌘ G", "Move to the next match in the Find bar.", category),
            shortcut("\(prefix)-find-previous", "Previous find match", "⌘ ⇧ G", "Move to the previous match in the Find bar.", category),
            shortcut("\(prefix)-bookmark", "Bookmark page", "⌘ D", "Bookmark the current page.", category),
            shortcut("\(prefix)-back", "Go back", "⌘ [", "Open the previous page in the current tab's history.", category, tags: ["navigation"]),
            shortcut("\(prefix)-forward", "Go forward", "⌘ ]", "Open the next page in the current tab's history.", category, tags: ["navigation"]),
            shortcut("\(prefix)-zoom-in", "Zoom in", "⌘ +", "Increase page zoom.", category, tags: ["accessibility"]),
            shortcut("\(prefix)-zoom-out", "Zoom out", "⌘ -", "Decrease page zoom.", category, tags: ["accessibility"]),
            shortcut("\(prefix)-zoom-reset", "Reset zoom", "⌘ 0", "Restore the default page zoom.", category, tags: ["accessibility"]),
            shortcut("\(prefix)-save-page", "Save page", "⌘ S", "Save the current webpage.", category),
            shortcut("\(prefix)-open-file", "Open local file", "⌘ O", "Open a local file in the browser.", category, tags: ["developer"])
        ]

        switch category {
        case .chrome, .brave:
            let privateName = category == .chrome ? "New Incognito window" : "New private window"
            result += [
                shortcut("\(prefix)-private-window", privateName, "⌘ ⇧ N", "Open a private browsing window.", category, tags: ["privacy"]),
                shortcut("\(prefix)-devtools", "Open Developer Tools", "⌘ ⌥ I", "Open the browser developer tools.", category, tags: ["developer"]),
                shortcut("\(prefix)-console", "Open JavaScript Console", "⌘ ⌥ J", "Open developer tools directly to the JavaScript console.", category, tags: ["developer", "JavaScript"]),
                shortcut("\(prefix)-source", "View page source", "⌘ ⌥ U", "Display the current page's non-editable HTML source.", category, tags: ["developer", "HTML"]),
                shortcut("\(prefix)-downloads", "Open downloads", "⌘ ⇧ J", "Open the browser downloads page.", category),
                shortcut("\(prefix)-history", "Open history", "⌘ Y", "Open browsing history.", category),
                shortcut("\(prefix)-clear-data", "Clear browsing data", "⌘ ⇧ Delete", "Open browsing-data deletion controls.", category, tags: ["privacy"]),
                shortcut("\(prefix)-bookmarks-bar", "Toggle bookmarks bar", "⌘ ⇧ B", "Show or hide the bookmarks bar.", category)
            ]
        case .firefox:
            result += [
                shortcut("firefox-private-window", "New private window", "⌘ ⇧ P", "Open a private browsing window.", category, tags: ["privacy"]),
                shortcut("firefox-devtools", "Open Developer Tools", "⌘ ⌥ I", "Open Firefox developer tools.", category, tags: ["developer"]),
                shortcut("firefox-console", "Open Web Console", "⌘ ⌥ K", "Open developer tools directly to the Web Console.", category, tags: ["developer", "JavaScript"]),
                shortcut("firefox-inspector", "Open Inspector", "⌘ ⌥ C", "Inspect and edit page HTML and CSS.", category, tags: ["developer", "HTML", "CSS"]),
                shortcut("firefox-network", "Open Network Monitor", "⌘ ⌥ E", "Inspect requests made by the current page.", category, tags: ["developer", "network"]),
                shortcut("firefox-responsive", "Responsive Design View", "⌘ ⌥ M", "Test the page at responsive viewport sizes.", category, tags: ["developer", "responsive"]),
                shortcut("firefox-source", "View page source", "⌘ U", "Display the current page's source.", category, tags: ["developer", "HTML"]),
                shortcut("firefox-downloads", "Open downloads", "⌘ J", "Open the Downloads panel.", category),
                shortcut("firefox-history", "Open history", "⌘ ⇧ H", "Open Firefox browsing history.", category),
                shortcut("firefox-clear-history", "Clear recent history", "⌘ ⇧ Delete", "Open controls for clearing recent browsing history.", category, tags: ["privacy"]),
                shortcut("firefox-screenshot", "Take page screenshot", "⌘ ⇧ S", "Open Firefox's webpage screenshot tool.", category)
            ]
        default:
            break
        }
        return result
    }
}
