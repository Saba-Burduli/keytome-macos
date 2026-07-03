import Foundation

enum SeedData {
    static let items: [ReferenceItem] = macOS + chrome + firefox + dia + brave + terminal + homebrew + zsh + vimNvim + jetBrains + visualStudio + xcode

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

    static let vimNvim: [ReferenceItem] = [
        shortcut("vim-left", "Move left", "h", "Move one character left in Normal mode.", .vimNvim, tags: ["motion"]),
        shortcut("vim-down", "Move down", "j", "Move one line down in Normal mode.", .vimNvim, tags: ["motion"]),
        shortcut("vim-up", "Move up", "k", "Move one line up in Normal mode.", .vimNvim, tags: ["motion"]),
        shortcut("vim-right", "Move right", "l", "Move one character right in Normal mode.", .vimNvim, tags: ["motion"]),
        shortcut("vim-word", "Next word", "w", "Move to the start of the next word.", .vimNvim, tags: ["motion"]),
        shortcut("vim-word-back", "Previous word", "b", "Move to the start of the previous word.", .vimNvim, tags: ["motion"]),
        shortcut("vim-word-end", "End of word", "e", "Move to the end of the current or next word.", .vimNvim, tags: ["motion"]),
        shortcut("vim-line-start", "Start of line", "0", "Move to the first character of the line.", .vimNvim, tags: ["motion"]),
        shortcut("vim-first-nonblank", "First non-blank", "^", "Move to the first non-blank character of the line.", .vimNvim, tags: ["motion"]),
        shortcut("vim-line-end", "End of line", "$", "Move to the end of the line.", .vimNvim, tags: ["motion"]),
        shortcut("vim-file-start", "First line", "gg", "Move to the first line of the buffer.", .vimNvim, tags: ["motion"]),
        shortcut("vim-file-end", "Last line", "G", "Move to the last line of the buffer.", .vimNvim, tags: ["motion"]),
        shortcut("vim-search", "Search forward", "/pattern", "Search forward for a pattern.", .vimNvim, tags: ["search"]),
        shortcut("vim-search-next", "Next search result", "n", "Repeat the latest search in the same direction.", .vimNvim, tags: ["search"]),
        shortcut("vim-search-previous", "Previous search result", "N", "Repeat the latest search in the opposite direction.", .vimNvim, tags: ["search"]),
        shortcut("vim-command", "Command-line mode", ":", "Enter an Ex command on the command line.", .vimNvim, tags: ["mode"]),
        shortcut("vim-normal", "Return to Normal mode", "Esc", "Leave Insert, Visual, Search, or Command mode.", .vimNvim, tags: ["mode"]),
        shortcut("vim-insert", "Insert before cursor", "i", "Enter Insert mode before the cursor.", .vimNvim, tags: ["editing"]),
        shortcut("vim-append", "Append after cursor", "a", "Enter Insert mode after the cursor.", .vimNvim, tags: ["editing"]),
        shortcut("vim-visual", "Visual character mode", "v", "Start a characterwise visual selection.", .vimNvim, tags: ["selection"]),
        shortcut("vim-yank-line", "Yank line", "yy", "Copy the current line into a register.", .vimNvim, tags: ["copy", "register"]),
        shortcut("vim-paste-after", "Put after cursor", "p", "Put register contents after the cursor or below the line.", .vimNvim, tags: ["paste", "register"]),
        shortcut("vim-delete-line", "Delete line", "dd", "Delete the current line into a register.", .vimNvim, tags: ["editing", "register"]),
        shortcut("vim-undo", "Undo", "u", "Undo the latest change.", .vimNvim, tags: ["editing"]),
        shortcut("vim-redo", "Redo", "⌃ R", "Redo a change that was undone.", .vimNvim, tags: ["editing"]),
        shortcut("vim-help", "Open help", ":help", "Open Neovim help for a command or topic.", .vimNvim, tags: ["help"])
    ]

    private static let jetBrainsTags = [
        "IntelliJ IDEA", "PyCharm", "WebStorm", "PhpStorm", "CLion", "GoLand",
        "Rider", "RubyMine", "DataGrip", "DataSpell", "RustRover", "MPS", "Writerside",
        "Android Studio", "macOS keymap"
    ]

    static let jetBrains: [ReferenceItem] = [
        shortcut("jetbrains-search-everywhere", "Search Everywhere", "⇧ ⇧", "Find files, actions, symbols, settings, and VCS items.", .jetBrains, tags: jetBrainsTags + ["search"]),
        shortcut("jetbrains-find-action", "Find Action", "⌘ ⇧ A", "Search for and run any IDE action.", .jetBrains, tags: jetBrainsTags + ["search"]),
        shortcut("jetbrains-project-window", "Show Project window", "⌘ 1", "Focus the Project tool window.", .jetBrains, tags: jetBrainsTags + ["tool window"]),
        shortcut("jetbrains-intention", "Show intention actions", "⌥ Enter", "Show quick fixes and context actions.", .jetBrains, tags: jetBrainsTags + ["quick fix"]),
        shortcut("jetbrains-recent-files", "Recent files", "⌘ E", "Open the recent-files popup.", .jetBrains, tags: jetBrainsTags + ["navigation"]),
        shortcut("jetbrains-find-usages", "Find usages", "⌥ F7", "Find usages of the symbol under the caret.", .jetBrains, tags: jetBrainsTags + ["navigation"]),
        shortcut("jetbrains-select-in", "Select In", "⌥ F1", "Select the current file in another view.", .jetBrains, tags: jetBrainsTags + ["navigation"]),
        shortcut("jetbrains-settings", "Open settings", "⌘ ,", "Open IDE settings.", .jetBrains, tags: jetBrainsTags),
        shortcut("jetbrains-generate", "Generate code", "⌘ N", "Open code-generation actions for the current context.", .jetBrains, tags: jetBrainsTags + ["code"]),
        shortcut("jetbrains-run-anything", "Run Anything", "⌃ ⌃", "Run commands, configurations, and project targets.", .jetBrains, tags: jetBrainsTags + ["run"]),
        shortcut("jetbrains-vcs-popup", "VCS operations", "⌃ V", "Open the version-control operations popup.", .jetBrains, tags: jetBrainsTags + ["git", "VCS"]),
        shortcut("jetbrains-refactor", "Refactor This", "⌃ T", "Open refactorings available for the selected symbol.", .jetBrains, tags: jetBrainsTags + ["refactor"]),
        shortcut("jetbrains-reformat", "Reformat code", "⌘ ⌥ L", "Reformat the current file or selection.", .jetBrains, tags: jetBrainsTags + ["format"]),
        shortcut("jetbrains-build", "Build project", "⌘ F9", "Build the current project.", .jetBrains, tags: jetBrainsTags + ["build"]),
        shortcut("jetbrains-rebuild", "Rebuild project", "⌘ ⇧ F9", "Rebuild the current project from scratch.", .jetBrains, tags: jetBrainsTags + ["build"]),
        shortcut("jetbrains-run", "Run", "⌃ R", "Run the selected configuration.", .jetBrains, tags: jetBrainsTags + ["run"]),
        shortcut("jetbrains-debug", "Debug", "⌃ D", "Debug the selected configuration.", .jetBrains, tags: jetBrainsTags + ["debug"]),
        shortcut("jetbrains-breakpoints", "View breakpoints", "⌘ ⇧ F8", "Open the Breakpoints dialog.", .jetBrains, tags: jetBrainsTags + ["debug"]),
        shortcut("jetbrains-completion", "Basic completion", "⌃ Space", "Show context-aware code-completion suggestions.", .jetBrains, tags: jetBrainsTags + ["completion"]),
        shortcut("jetbrains-smart-completion", "Smart completion", "⌃ ⇧ Space", "Filter completion suggestions by the expected type.", .jetBrains, tags: jetBrainsTags + ["completion"]),
        shortcut("jetbrains-complete-statement", "Complete statement", "⌘ ⇧ Enter", "Complete the current statement and position the caret.", .jetBrains, tags: jetBrainsTags + ["editing"]),
        shortcut("jetbrains-line-comment", "Toggle line comment", "⌘ /", "Comment or uncomment the current line or selection.", .jetBrains, tags: jetBrainsTags + ["editing"]),
        shortcut("jetbrains-block-comment", "Toggle block comment", "⌘ ⌥ /", "Comment or uncomment a block selection.", .jetBrains, tags: jetBrainsTags + ["editing"]),
        shortcut("jetbrains-declaration", "Go to declaration", "⌘ B", "Navigate to a symbol's declaration.", .jetBrains, tags: jetBrainsTags + ["navigation"]),
        shortcut("jetbrains-implementation", "Go to implementation", "⌘ ⌥ B", "Navigate to an implementation of the selected symbol.", .jetBrains, tags: jetBrainsTags + ["navigation"]),
        shortcut("jetbrains-class", "Go to class", "⌘ O", "Search for and open a class.", .jetBrains, tags: jetBrainsTags + ["navigation"]),
        shortcut("jetbrains-file", "Go to file", "⌘ ⇧ O", "Search for and open a file.", .jetBrains, tags: jetBrainsTags + ["navigation"]),
        shortcut("jetbrains-symbol", "Go to symbol", "⌘ ⌥ O", "Search for and navigate to a symbol.", .jetBrains, tags: jetBrainsTags + ["navigation"]),
        shortcut("jetbrains-rename", "Rename", "⇧ F6", "Rename the selected symbol safely across the project.", .jetBrains, tags: jetBrainsTags + ["refactor"]),
        shortcut("jetbrains-next-error", "Next highlighted error", "F2", "Move to the next highlighted code issue.", .jetBrains, tags: jetBrainsTags + ["diagnostics"]),
        shortcut("jetbrains-previous-error", "Previous highlighted error", "⇧ F2", "Move to the previous highlighted code issue.", .jetBrains, tags: jetBrainsTags + ["diagnostics"]),
        shortcut("jetbrains-extend-selection", "Extend selection", "⌥ ↑", "Expand selection to the next enclosing code construct.", .jetBrains, tags: jetBrainsTags + ["selection"]),
        shortcut("jetbrains-shrink-selection", "Shrink selection", "⌥ ↓", "Reduce structural selection to the previous scope.", .jetBrains, tags: jetBrainsTags + ["selection"])
    ]

    static let visualStudio: [ReferenceItem] = [
        shortcut("vs-build-solution", "Build solution", "Ctrl+Shift+B", "Build all projects in the current solution.", .visualStudio, tags: ["Windows", "General profile", "build"]),
        shortcut("vs-cancel-build", "Cancel build", "Ctrl+Break", "Cancel the active build operation.", .visualStudio, tags: ["Windows", "General profile", "build"]),
        shortcut("vs-start-debug", "Start debugging", "F5", "Start the current project with the debugger.", .visualStudio, tags: ["Windows", "General profile", "debug"]),
        shortcut("vs-start-without-debug", "Start without debugging", "Ctrl+F5", "Run the current project without attaching the debugger.", .visualStudio, tags: ["Windows", "General profile", "run"]),
        shortcut("vs-restart-debug", "Restart debugging", "Ctrl+Shift+F5", "Restart the current debugging session.", .visualStudio, tags: ["Windows", "General profile", "debug"]),
        shortcut("vs-stop-debug", "Stop debugging", "Shift+F5", "Stop the current debugging session.", .visualStudio, tags: ["Windows", "General profile", "debug"]),
        shortcut("vs-step-over", "Step over", "F10", "Execute the current statement without entering calls.", .visualStudio, tags: ["Windows", "General profile", "debug"]),
        shortcut("vs-step-into", "Step into", "F11", "Execute the current statement and enter called code.", .visualStudio, tags: ["Windows", "General profile", "debug"]),
        shortcut("vs-step-out", "Step out", "Shift+F11", "Run until the current function returns.", .visualStudio, tags: ["Windows", "General profile", "debug"]),
        shortcut("vs-run-to-cursor", "Run to cursor", "Ctrl+F10", "Continue execution to the line under the cursor.", .visualStudio, tags: ["Windows", "General profile", "debug"]),
        shortcut("vs-toggle-breakpoint", "Toggle breakpoint", "F9", "Add or remove a breakpoint on the current line.", .visualStudio, tags: ["Windows", "General profile", "debug"]),
        shortcut("vs-delete-breakpoints", "Delete all breakpoints", "Ctrl+Shift+F9", "Remove every breakpoint in the solution.", .visualStudio, tags: ["Windows", "General profile", "debug"]),
        shortcut("vs-quick-watch", "QuickWatch", "Shift+F9", "Inspect the selected expression while debugging.", .visualStudio, tags: ["Windows", "General profile", "debug"]),
        shortcut("vs-find", "Find", "Ctrl+F", "Search within the current document.", .visualStudio, tags: ["Windows", "General profile", "search"]),
        shortcut("vs-find-files", "Find in files", "Ctrl+Shift+F", "Search across files in the selected scope.", .visualStudio, tags: ["Windows", "General profile", "search"]),
        shortcut("vs-find-next", "Find next", "F3", "Move to the next search match.", .visualStudio, tags: ["Windows", "General profile", "search"]),
        shortcut("vs-find-previous", "Find previous", "Shift+F3", "Move to the previous search match.", .visualStudio, tags: ["Windows", "General profile", "search"]),
        shortcut("vs-replace", "Replace", "Ctrl+H", "Find and replace text in the current document.", .visualStudio, tags: ["Windows", "General profile", "search"]),
        shortcut("vs-format-document", "Format document", "Ctrl+K, Ctrl+D", "Format the entire active document.", .visualStudio, tags: ["Windows", "General profile", "format"]),
        shortcut("vs-format-selection", "Format selection", "Ctrl+K, Ctrl+F", "Format the selected code.", .visualStudio, tags: ["Windows", "General profile", "format"]),
        shortcut("vs-comment", "Comment selection", "Ctrl+K, Ctrl+C", "Comment the selected lines.", .visualStudio, tags: ["Windows", "General profile", "editing"]),
        shortcut("vs-uncomment", "Uncomment selection", "Ctrl+K, Ctrl+U", "Uncomment the selected lines.", .visualStudio, tags: ["Windows", "General profile", "editing"]),
        shortcut("vs-definition", "Go to definition", "F12", "Navigate to the definition of the selected symbol.", .visualStudio, tags: ["Windows", "General profile", "navigation"]),
        shortcut("vs-declaration", "Go to declaration", "Ctrl+F12", "Navigate to the declaration of the selected symbol.", .visualStudio, tags: ["Windows", "General profile", "navigation"]),
        shortcut("vs-peek", "Peek definition", "Alt+F12", "Open the selected symbol's definition inline.", .visualStudio, tags: ["Windows", "General profile", "navigation"]),
        shortcut("vs-references", "Find all references", "Shift+F12", "Find references to the selected symbol.", .visualStudio, tags: ["Windows", "General profile", "navigation"]),
        shortcut("vs-navigate", "Go to All", "Ctrl+,", "Search files, types, members, and symbols.", .visualStudio, tags: ["Windows", "General profile", "navigation"]),
        shortcut("vs-open", "Open file", "Ctrl+O", "Open an existing file.", .visualStudio, tags: ["Windows", "General profile", "file"]),
        shortcut("vs-save", "Save", "Ctrl+S", "Save the active document.", .visualStudio, tags: ["Windows", "General profile", "file"]),
        shortcut("vs-save-all", "Save all", "Ctrl+Shift+S", "Save all modified files.", .visualStudio, tags: ["Windows", "General profile", "file"]),
        shortcut("vs-close-document", "Close active document", "Ctrl+F4", "Close the active document tab.", .visualStudio, tags: ["Windows", "General profile", "window"]),
        shortcut("vs-solution-explorer", "Open Solution Explorer", "Ctrl+Alt+L", "Focus the Solution Explorer tool window.", .visualStudio, tags: ["Windows", "General profile", "tool window"])
    ]

    static let xcode: [ReferenceItem] = [
        shortcut("xcode-add-files", "Add files", "⌘ ⌥ A", "Add existing files to the current project.", .xcode, tags: ["file"]),
        shortcut("xcode-open", "Open", "⌘ O", "Open a project, workspace, or file.", .xcode, tags: ["file"]),
        shortcut("xcode-open-quickly", "Open Quickly", "⌘ ⇧ O", "Search and open project files and symbols.", .xcode, tags: ["search", "navigation"]),
        shortcut("xcode-save", "Save", "⌘ S", "Save the active document.", .xcode, tags: ["file"]),
        shortcut("xcode-save-all", "Save all", "⌘ ⌥ S", "Save every modified document.", .xcode, tags: ["file"]),
        shortcut("xcode-find", "Find", "⌘ F", "Find text in the active editor.", .xcode, tags: ["search"]),
        shortcut("xcode-replace", "Find and replace", "⌘ ⌥ F", "Find and replace text in the active editor.", .xcode, tags: ["search"]),
        shortcut("xcode-find-next", "Find next", "⌘ G", "Move to the next local search match.", .xcode, tags: ["search"]),
        shortcut("xcode-find-previous", "Find previous", "⌘ ⇧ G", "Move to the previous local search match.", .xcode, tags: ["search"]),
        shortcut("xcode-find-workspace", "Find in workspace", "⌘ ⇧ F", "Search across the current workspace.", .xcode, tags: ["search"]),
        shortcut("xcode-replace-workspace", "Replace in workspace", "⌘ ⌥ ⇧ F", "Find and replace across the current workspace.", .xcode, tags: ["search"]),
        shortcut("xcode-find-symbol", "Find selected symbol", "⌘ ⌃ ⇧ F", "Find the selected symbol across the workspace.", .xcode, tags: ["search", "symbol"]),
        shortcut("xcode-call-hierarchy", "Find call hierarchy", "⌘ ⌃ ⇧ H", "Find callers and callees of the selected symbol.", .xcode, tags: ["navigation", "symbol"]),
        shortcut("xcode-reveal-project", "Reveal in Project Navigator", "⌘ ⇧ J", "Reveal the active file in the Project navigator.", .xcode, tags: ["navigation"]),
        shortcut("xcode-focus-editor", "Move focus to editor pane", "⌘ J", "Move keyboard focus to an editor pane.", .xcode, tags: ["navigation"]),
        shortcut("xcode-history-next", "Next location in history", "⌘ ⌃ →", "Move forward through navigation history.", .xcode, tags: ["navigation"]),
        shortcut("xcode-history-previous", "Previous location in history", "⌘ ⌃ ←", "Move backward through navigation history.", .xcode, tags: ["navigation"]),
        shortcut("xcode-definition", "Jump to definition", "⌘ ⌃ J", "Navigate to the selected symbol's definition.", .xcode, tags: ["navigation", "symbol"]),
        shortcut("xcode-next-issue", "Jump to next issue", "⌘ '", "Move to the next build or analysis issue.", .xcode, tags: ["diagnostics"]),
        shortcut("xcode-previous-issue", "Jump to previous issue", "⌘ \"", "Move to the previous build or analysis issue.", .xcode, tags: ["diagnostics"]),
        shortcut("xcode-build", "Build", "⌘ B", "Build the active scheme.", .xcode, tags: ["build"]),
        shortcut("xcode-analyze", "Analyze", "⌘ ⇧ B", "Run static analysis for the active scheme.", .xcode, tags: ["build", "diagnostics"]),
        shortcut("xcode-clean", "Clean build folder", "⌘ ⇧ K", "Remove build products for the active scheme.", .xcode, tags: ["build"]),
        shortcut("xcode-run", "Run", "⌘ R", "Build and run the active scheme.", .xcode, tags: ["run"]),
        shortcut("xcode-test", "Test", "⌘ U", "Build and run tests for the active scheme.", .xcode, tags: ["test"]),
        shortcut("xcode-profile", "Profile", "⌘ I", "Build and profile the active scheme with Instruments.", .xcode, tags: ["profile"]),
        shortcut("xcode-stop", "Stop", "⌘ .", "Stop the active build, run, test, or profile operation.", .xcode, tags: ["run", "debug"]),
        shortcut("xcode-build-docs", "Build documentation", "⌘ ⌃ ⇧ D", "Build DocC documentation for the project.", .xcode, tags: ["documentation"]),
        shortcut("xcode-pause", "Pause or continue", "⌘ ⌃ Y", "Pause or continue the current debugging session.", .xcode, tags: ["debug"]),
        shortcut("xcode-continue-line", "Continue to current line", "⌘ ⌃ C", "Continue execution to the current source line.", .xcode, tags: ["debug"]),
        shortcut("xcode-step-over", "Step over", "F6", "Execute the current line without entering calls.", .xcode, tags: ["debug"]),
        shortcut("xcode-step-into", "Step into", "F7", "Execute the current line and enter called code.", .xcode, tags: ["debug"]),
        shortcut("xcode-step-out", "Step out", "F8", "Continue until the current function returns.", .xcode, tags: ["debug"]),
        shortcut("xcode-breakpoints", "Activate breakpoints", "⌘ Y", "Enable or disable all breakpoints.", .xcode, tags: ["debug"])
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
