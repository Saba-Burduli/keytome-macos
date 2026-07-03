import Foundation

extension SeedData {
    static let vibeCodingItems: [ReferenceItem] =
        cursor + githubCopilot + zed + zedAgent + windsurf + claudeCode + openAICodex + aider +
        junie + cline + warp + replit + firebaseStudio + obsidian + codexApp + hermesAgent +
        openClaw + blender + unity + unrealEngine

    static let cursor: [ReferenceItem] = [
        shortcut("cursor-agent", "Open Agent", "⌘ I", "Open Cursor Agent in the side panel.", .cursor),
        shortcut("cursor-chat", "Open Chat", "⌘ L", "Open Cursor Chat.", .cursor),
        shortcut("cursor-background", "Background agents", "⌘ E", "Open background agents.", .cursor),
        shortcut("cursor-inline", "Inline edit", "⌘ K", "Open the inline edit prompt.", .cursor),
        shortcut("cursor-full-file", "Full-file edit", "⌘ ⇧ K", "Open a full-file edit prompt.", .cursor),
        shortcut("cursor-mode", "Choose mode", "⌘ .", "Open the Agent mode menu.", .cursor),
        shortcut("cursor-model", "Cycle model", "⌘ /", "Cycle through available AI models.", .cursor),
        shortcut("cursor-settings", "Cursor settings", "⌘ ⇧ J", "Open Cursor-specific settings.", .cursor),
        shortcut("cursor-palette", "Command palette", "⌘ ⇧ P", "Search and run editor actions.", .cursor),
        shortcut("cursor-accept", "Accept suggestion", "Tab", "Accept the current Tab completion.", .cursor),
        shortcut("cursor-new-chat", "New chat", "⌘ N", "Start a new chat while Chat has focus.", .cursor),
        shortcut("cursor-submit", "Submit prompt", "Enter", "Send the current chat prompt.", .cursor),
        shortcut("cursor-queue", "Queue prompt", "⌘ Enter", "Queue a follow-up prompt.", .cursor),
        shortcut("cursor-add-context", "Add selection to chat", "⌘ ⇧ L", "Attach the selected code to Chat.", .cursor),
        shortcut("cursor-terminal", "Generate in terminal", "⌘ K", "Open the terminal prompt when Terminal has focus.", .cursor)
    ]

    static let githubCopilot: [ReferenceItem] = [
        shortcut("copilot-chat", "Open Chat", "⌃ ⌘ I", "Open GitHub Copilot Chat in VS Code on macOS.", .githubCopilot),
        shortcut("copilot-agent", "Open Agent", "⌘ ⇧ I", "Open a new Copilot agent session.", .githubCopilot),
        shortcut("copilot-inline", "Inline Chat", "⌘ I", "Open Copilot Inline Chat in the editor.", .githubCopilot),
        shortcut("copilot-quick", "Quick Chat", "⌘ ⌥ ⇧ L", "Open the lightweight Quick Chat control.", .githubCopilot),
        shortcut("copilot-agents", "Choose agent", "⌘ .", "Open the agent picker in Chat.", .githubCopilot),
        shortcut("copilot-model", "Choose model", "⌘ ⌥ .", "Open the language-model picker.", .githubCopilot),
        shortcut("copilot-new", "New chat", "⌘ N", "Start a new chat while Chat has focus.", .githubCopilot),
        shortcut("copilot-accept", "Accept suggestion", "Tab", "Accept an inline completion.", .githubCopilot),
        shortcut("copilot-dismiss", "Dismiss suggestion", "Esc", "Dismiss the current inline completion.", .githubCopilot),
        shortcut("copilot-next", "Next suggestion", "⌥ ]", "Show the next inline suggestion.", .githubCopilot),
        shortcut("copilot-previous", "Previous suggestion", "⌥ [", "Show the previous inline suggestion.", .githubCopilot),
        shortcut("copilot-word", "Accept next word", "⌘ →", "Accept the next word of an inline suggestion.", .githubCopilot),
        shortcut("copilot-terminal", "Terminal Inline Chat", "⌘ I", "Open Copilot Inline Chat in the terminal.", .githubCopilot),
        shortcut("copilot-voice", "Start voice chat", "⌘ I", "Start voice input when the Chat input has focus.", .githubCopilot, tags: ["context dependent"]),
        shortcut("copilot-palette", "Command palette", "⌘ ⇧ P", "Search for all GitHub Copilot commands.", .githubCopilot)
    ]

    static let zed: [ReferenceItem] = [
        shortcut("zed-palette", "Command palette", "⌘ ⇧ P", "Search and run Zed actions.", .zed),
        shortcut("zed-file", "Go to file", "⌘ P", "Open a file by name.", .zed),
        shortcut("zed-symbol", "Go to symbol", "⌘ ⇧ O", "Navigate to a symbol in the current file.", .zed),
        shortcut("zed-project-search", "Search project", "⌘ ⇧ F", "Search text across the project.", .zed),
        shortcut("zed-find", "Find in buffer", "⌘ F", "Find text in the active buffer.", .zed),
        shortcut("zed-replace", "Replace in buffer", "⌘ ⌥ F", "Open find and replace.", .zed),
        shortcut("zed-terminal", "Toggle terminal", "⌃ `", "Show or hide the integrated terminal.", .zed),
        shortcut("zed-settings", "Open settings", "⌘ ,", "Open Zed settings.", .zed),
        shortcut("zed-new", "New file", "⌘ N", "Create a new buffer.", .zed),
        shortcut("zed-save", "Save", "⌘ S", "Save the current buffer.", .zed),
        shortcut("zed-close", "Close item", "⌘ W", "Close the active item.", .zed),
        shortcut("zed-split", "Split pane", "⌘ K →", "Split the workspace pane to the right.", .zed),
        shortcut("zed-definition", "Go to definition", "F12", "Navigate to a symbol definition.", .zed),
        shortcut("zed-rename", "Rename symbol", "F2", "Rename the symbol under the cursor.", .zed),
        shortcut("zed-diagnostics", "Next diagnostic", "F8", "Move to the next diagnostic.", .zed)
    ]

    static let zedAgent: [ReferenceItem] = [
        shortcut("zed-agent-panel", "Toggle Agent panel", "⌘ ?", "Open or close the Agent panel.", .zedAgent, confidence: .common),
        shortcut("zed-agent-inline", "Inline assist", "⌃ Enter", "Open inline assistant for the selection.", .zedAgent, confidence: .common),
        shortcut("zed-agent-context", "Add context", "@", "Open the context picker in an Agent prompt.", .zedAgent),
        shortcut("zed-agent-command", "Open commands", "/", "Open slash-command completion in an Agent prompt.", .zedAgent),
        shortcut("zed-agent-submit", "Submit prompt", "Enter", "Send the current Agent prompt.", .zedAgent),
        shortcut("zed-agent-newline", "Insert newline", "⇧ Enter", "Add a line without submitting.", .zedAgent),
        shortcut("zed-agent-cancel", "Cancel generation", "Esc", "Stop or dismiss the current Agent action.", .zedAgent),
        shortcut("zed-agent-new", "New thread", "⌘ N", "Create a thread while the Agent panel is focused.", .zedAgent, confidence: .common),
        shortcut("zed-agent-history", "Thread history", "⌘ ⇧ H", "Open Agent thread history.", .zedAgent, confidence: .common),
        command("zed-agent-file", "Mention file", "@file", "Attach a project file to the prompt.", .zedAgent),
        command("zed-agent-symbol", "Mention symbol", "@symbol", "Attach a code symbol to the prompt.", .zedAgent),
        command("zed-agent-thread", "Mention thread", "@thread", "Reference another Agent thread.", .zedAgent),
        command("zed-agent-rules", "Project rules", ".rules", "Store project-level Agent instructions.", .zedAgent),
        command("zed-agent-profile", "Agent profile", "agent_profiles", "Configure tools and model behavior in settings.", .zedAgent),
        command("zed-agent-server", "Agent server", "agent_servers", "Configure an ACP-compatible external agent.", .zedAgent)
    ]

    static let windsurf: [ReferenceItem] = [
        shortcut("windsurf-cascade", "Open Cascade", "⌘ L", "Open the Cascade assistant.", .windsurf),
        shortcut("windsurf-mode", "Switch Cascade mode", "⌘ .", "Cycle Code, Plan, and Ask modes.", .windsurf),
        shortcut("windsurf-command", "Command inline edit", "⌘ I", "Open Windsurf Command for inline generation.", .windsurf),
        shortcut("windsurf-palette", "Command palette", "⌘ ⇧ P", "Search and run editor commands.", .windsurf),
        shortcut("windsurf-file", "Quick open", "⌘ P", "Open a file by name.", .windsurf),
        shortcut("windsurf-search", "Project search", "⌘ ⇧ F", "Search across the workspace.", .windsurf),
        shortcut("windsurf-terminal", "Toggle terminal", "⌃ `", "Show or hide the integrated terminal.", .windsurf),
        shortcut("windsurf-accept", "Accept completion", "Tab", "Accept the current Supercomplete suggestion.", .windsurf),
        shortcut("windsurf-dismiss", "Dismiss completion", "Esc", "Dismiss the current suggestion.", .windsurf),
        shortcut("windsurf-submit", "Submit prompt", "Enter", "Send a Cascade prompt.", .windsurf),
        shortcut("windsurf-newline", "Prompt newline", "⇧ Enter", "Insert a new line in the prompt.", .windsurf),
        shortcut("windsurf-context", "Add code context", "⌘ ⇧ L", "Send selected code to Cascade.", .windsurf, confidence: .common),
        command("windsurf-mention", "Mention context", "@", "Attach files, directories, or other context.", .windsurf),
        command("windsurf-rules", "Workspace rules", ".windsurfrules", "Provide durable workspace instructions.", .windsurf),
        command("windsurf-mcp", "MCP settings", "MCP", "Manage Cascade MCP servers from settings.", .windsurf)
    ]

    static let claudeCode: [ReferenceItem] = [
        command("claude-start", "Start Claude Code", "claude", "Launch an interactive session.", .claudeCode),
        command("claude-print", "Print response", "claude -p \"prompt\"", "Run non-interactively and print the result.", .claudeCode),
        command("claude-continue", "Continue session", "claude -c", "Continue the most recent conversation.", .claudeCode),
        command("claude-resume", "Resume session", "claude -r", "Choose and resume a previous conversation.", .claudeCode),
        command("claude-model", "Choose model", "claude --model <model>", "Start with a specific model.", .claudeCode),
        command("claude-permission", "Permission mode", "claude --permission-mode <mode>", "Select an approval policy for the session.", .claudeCode),
        command("claude-add-dir", "Add directory", "claude --add-dir <path>", "Grant access to another working directory.", .claudeCode),
        command("claude-mcp", "Manage MCP", "claude mcp", "Configure Model Context Protocol servers.", .claudeCode),
        command("claude-update", "Update Claude Code", "claude update", "Check for and install an update.", .claudeCode),
        command("claude-init", "Initialize memory", "/init", "Create a CLAUDE.md project guide.", .claudeCode),
        command("claude-clear", "Clear conversation", "/clear", "Start fresh in the current terminal session.", .claudeCode),
        command("claude-compact", "Compact context", "/compact", "Summarize conversation context.", .claudeCode),
        command("claude-config", "Open config", "/config", "Open Claude Code configuration.", .claudeCode),
        command("claude-cost", "Show cost", "/cost", "Show token usage and cost for the session.", .claudeCode),
        command("claude-doctor", "Run diagnostics", "/doctor", "Check installation and configuration health.", .claudeCode)
    ]

    static let openAICodex: [ReferenceItem] = [
        command("codex-start", "Start Codex", "codex", "Launch the interactive terminal UI.", .openAICodex),
        command("codex-exec", "Run non-interactively", "codex exec \"prompt\"", "Execute a task and stream the result.", .openAICodex),
        command("codex-resume", "Resume a session", "codex resume", "Choose a saved conversation to continue.", .openAICodex),
        command("codex-fork", "Fork a session", "codex fork", "Branch a saved conversation into a new thread.", .openAICodex),
        command("codex-review", "Review changes", "codex review", "Run a code review from the terminal.", .openAICodex),
        command("codex-app", "Open desktop app", "codex app", "Launch the Codex desktop app.", .openAICodex),
        command("codex-doctor", "Run diagnostics", "codex doctor", "Generate an installation and configuration report.", .openAICodex),
        command("codex-model", "Choose model", "codex --model <model>", "Override the configured model.", .openAICodex),
        command("codex-search", "Enable live search", "codex --search", "Start Codex with live web search.", .openAICodex),
        command("codex-image", "Attach image", "codex --image <path>", "Attach an image to the initial prompt.", .openAICodex),
        command("codex-status", "Session status", "/status", "Inspect model, permissions, and token usage.", .openAICodex),
        command("codex-diff", "Review diff", "/diff", "Show working-tree changes in the TUI.", .openAICodex),
        command("codex-model-slash", "Switch model", "/model", "Choose the active model interactively.", .openAICodex),
        command("codex-permissions", "Set permissions", "/permissions", "Change approval and sandbox behavior.", .openAICodex),
        command("codex-compact", "Compact context", "/compact", "Summarize a long conversation to free context.", .openAICodex)
    ]

    static let aider: [ReferenceItem] = [
        command("aider-add", "Add files", "/add", "Add files to the editable chat context.", .aider),
        command("aider-read", "Add read-only files", "/read-only", "Add files as read-only context.", .aider),
        command("aider-drop", "Drop files", "/drop", "Remove files from the chat context.", .aider),
        command("aider-ask", "Ask mode", "/ask", "Ask about the code without editing it.", .aider),
        command("aider-code", "Code mode", "/code", "Switch to code-editing mode.", .aider),
        command("aider-architect", "Architect mode", "/architect", "Plan with an architect/editor model workflow.", .aider),
        command("aider-commit", "Commit changes", "/commit", "Commit Aider's current changes.", .aider),
        command("aider-diff", "Show diff", "/diff", "Display changes since the last message.", .aider),
        command("aider-undo", "Undo commit", "/undo", "Undo the last Aider-authored commit.", .aider),
        command("aider-lint", "Run linter", "/lint", "Lint files in the chat.", .aider),
        command("aider-test", "Run tests", "/test", "Run the configured test command.", .aider),
        command("aider-run", "Run shell command", "/run", "Run a shell command and optionally share output.", .aider),
        command("aider-model", "Switch model", "/model", "Change the active model.", .aider),
        command("aider-map", "Show repo map", "/map", "Display Aider's repository map.", .aider),
        command("aider-tokens", "Show token budget", "/tokens", "Report token use for the current context.", .aider)
    ]

    static let junie: [ReferenceItem] = [
        shortcut("junie-plan", "Toggle plan mode", "⇧ Tab", "Switch between default and plan mode.", .junie),
        shortcut("junie-brave", "Cycle Brave mode", "⌃ B", "Cycle command approval levels.", .junie),
        shortcut("junie-history", "Search prompt history", "⌃ R", "Search previous prompts.", .junie),
        shortcut("junie-transcript", "Open transcript", "⌃ T", "Open the full session transcript.", .junie),
        shortcut("junie-help", "Show shortcuts", "?", "Open Junie CLI help.", .junie),
        shortcut("junie-files", "Attach file", "@", "Search for a file or folder to attach.", .junie),
        shortcut("junie-shell", "Run shell command", "!", "Run a shell command from the prompt.", .junie),
        command("junie-review", "Review changes", "/review", "Start a local code review.", .junie),
        command("junie-debug", "Debug mode", "/debug", "Toggle live debugger assistant mode.", .junie),
        command("junie-settings", "Open settings", "/settings", "Change Junie CLI settings.", .junie),
        command("junie-worktree", "Manage worktrees", "/worktree", "Create or switch an isolated worktree.", .junie),
        command("junie-usage", "Show usage", "/usage", "Show session token and model cost.", .junie),
        command("junie-new", "New session", "/new", "Start a new Junie session.", .junie),
        command("junie-brave-command", "Set Brave mode", "/brave", "Cycle command approval levels.", .junie),
        command("junie-commands", "Custom commands", "/commands", "Create and manage custom slash commands.", .junie)
    ]

    static let cline: [ReferenceItem] = [
        shortcut("cline-palette", "Open Cline in new tab", "⌘ ⇧ P", "Run Cline: Open In New Tab from the palette.", .cline),
        shortcut("cline-extensions", "Open Extensions", "⌘ ⇧ X", "Find or manage the Cline extension.", .cline),
        shortcut("cline-shortcuts", "Open keyboard shortcuts", "⌘ K ⌘ S", "Assign shortcuts to Cline commands.", .cline),
        command("cline-newtask", "Start distilled task", "/newtask", "Start fresh with essential context preserved.", .cline),
        command("cline-smol", "Compact context", "/smol", "Compress conversation history.", .cline),
        command("cline-compact", "Compact alias", "/compact", "Alias for the smol context command.", .cline),
        command("cline-newrule", "Create rule", "/newrule", "Create a durable Cline rule file.", .cline),
        command("cline-plan", "Deep planning", "/deep-planning", "Investigate and create an implementation plan.", .cline),
        command("cline-explain", "Explain changes", "/explain-changes", "Explain the current Git diff.", .cline),
        command("cline-bug", "Report bug", "/reportbug", "Prepare a report with diagnostics.", .cline),
        command("cline-start", "Start Cline CLI", "cline", "Launch an interactive terminal session.", .cline),
        command("cline-headless", "Run headless", "cline \"task\"", "Run one task from the shell.", .cline),
        command("cline-auth", "Authenticate", "cline auth", "Sign in and configure a model provider.", .cline),
        command("cline-acp", "Start ACP server", "cline --acp", "Expose Cline to an ACP-compatible editor.", .cline),
        command("cline-jupyter", "Notebook AI commands", "cline.jupyterGenerateCell", "Bind Cline's Jupyter cell actions in editor shortcuts.", .cline)
    ]

    static let warp: [ReferenceItem] = [
        shortcut("warp-palette", "Command palette", "⌘ P", "Open Warp's command palette.", .warp),
        shortcut("warp-search", "Command search", "⌃ R", "Search command history.", .warp),
        shortcut("warp-generate", "Generate command", "⌃ `", "Open natural-language command generation.", .warp),
        shortcut("warp-workflows", "Open workflows", "⌃ ⇧ R", "Browse saved workflows.", .warp),
        shortcut("warp-drive", "Toggle Warp Drive", "⌘ \\", "Open shared Warp Drive resources.", .warp),
        shortcut("warp-focus", "Focus terminal input", "⌘ L", "Move focus to terminal input.", .warp),
        shortcut("warp-file", "File search", "⌘ O", "Open file search.", .warp),
        shortcut("warp-split", "Split pane right", "⌘ D", "Create a pane to the right.", .warp),
        shortcut("warp-clear", "Clear blocks", "⌘ K", "Clear terminal blocks.", .warp),
        shortcut("warp-copy-output", "Copy command output", "⌘ ⌥ ⇧ C", "Copy output from the selected block.", .warp),
        shortcut("warp-select-all", "Select all blocks", "⌘ A", "Select all terminal blocks.", .warp),
        shortcut("warp-bookmark-next", "Next bookmark", "⌥ ↓", "Select the closest bookmark below.", .warp),
        shortcut("warp-bookmark-prev", "Previous bookmark", "⌥ ↑", "Select the closest bookmark above.", .warp),
        shortcut("warp-launch", "Launch configurations", "⌃ ⌘ L", "Open the launch configuration palette.", .warp),
        shortcut("warp-theme", "Theme picker", "⌃ ⌘ T", "Open the theme picker.", .warp)
    ]

    static let replit: [ReferenceItem] = codeOSSCommon(.replit, prefix: "replit") + [
        shortcut("replit-run", "Run project", "⌘ Enter", "Run the current Replit project.", .replit, confidence: .common),
        shortcut("replit-shell", "Open Shell", "⌘ ⇧ S", "Open the Shell tool.", .replit, confidence: .common),
        shortcut("replit-agent", "Open Agent", "⌘ K", "Open Replit Agent.", .replit, confidence: .common)
    ]

    static let firebaseStudio: [ReferenceItem] = codeOSSCommon(.firebaseStudio, prefix: "firebase") + [
        shortcut("firebase-gemini", "Open Gemini", "⌘ ⇧ Space", "Open Gemini assistance in Firebase Studio.", .firebaseStudio, confidence: .common),
        shortcut("firebase-preview", "Open preview", "⌘ ⇧ P", "Use the command palette to open a web preview.", .firebaseStudio, confidence: .common),
        shortcut("firebase-terminal-extra", "Toggle terminal", "⌃ `", "Show or hide the integrated terminal.", .firebaseStudio)
    ]

    static let obsidian: [ReferenceItem] = [
        shortcut("obsidian-palette", "Command palette", "⌘ P", "Open Obsidian's command palette.", .obsidian),
        shortcut("obsidian-quick", "Quick switcher", "⌘ O", "Find and open a note.", .obsidian),
        shortcut("obsidian-search", "Search vault", "⌘ ⇧ F", "Search across the current vault.", .obsidian),
        shortcut("obsidian-new", "New note", "⌘ N", "Create a new note.", .obsidian),
        shortcut("obsidian-link", "Insert internal link", "⌘ K", "Insert or edit a link.", .obsidian),
        shortcut("obsidian-bold", "Toggle bold", "⌘ B", "Toggle bold formatting.", .obsidian),
        shortcut("obsidian-italic", "Toggle italic", "⌘ I", "Toggle italic formatting.", .obsidian),
        shortcut("obsidian-close", "Close tab", "⌘ W", "Close the active tab.", .obsidian),
        shortcut("obsidian-new-tab", "New tab", "⌘ T", "Open a new tab.", .obsidian),
        shortcut("obsidian-settings", "Open settings", "⌘ ,", "Open Obsidian settings.", .obsidian),
        shortcut("obsidian-back", "Navigate back", "⌘ ⌥ ←", "Go to the previous note in history.", .obsidian),
        shortcut("obsidian-forward", "Navigate forward", "⌘ ⌥ →", "Go to the next note in history.", .obsidian),
        shortcut("obsidian-open-link", "Open link under cursor", "⌥ Enter", "Open the link under the cursor.", .obsidian, confidence: .common),
        shortcut("obsidian-reading", "Toggle reading view", "⌘ E", "Switch editing and reading views.", .obsidian, confidence: .common),
        shortcut("obsidian-delete", "Delete paragraph", "⌘ ⇧ K", "Delete the current paragraph.", .obsidian, confidence: .common)
    ]

    static let codexApp: [ReferenceItem] = [
        shortcut("codexapp-new", "New thread", "⌘ N", "Start a new Codex thread.", .codexApp),
        shortcut("codexapp-open", "Open project", "⌘ O", "Open a local workspace.", .codexApp),
        shortcut("codexapp-settings", "Open settings", "⌘ ,", "Open Codex app settings.", .codexApp),
        shortcut("codexapp-find", "Find in thread", "⌘ F", "Find text in the active thread.", .codexApp),
        shortcut("codexapp-submit", "Submit prompt", "Enter", "Send the current prompt.", .codexApp),
        shortcut("codexapp-newline", "Insert newline", "⇧ Enter", "Insert a line without submitting.", .codexApp),
        shortcut("codexapp-attach", "Attach file", "⌘ ⇧ A", "Open the attachment picker.", .codexApp, confidence: .common),
        shortcut("codexapp-interrupt", "Interrupt task", "Esc", "Stop the active task.", .codexApp),
        shortcut("codexapp-close", "Close window", "⌘ W", "Close the active app window.", .codexApp),
        shortcut("codexapp-fullscreen", "Toggle full screen", "⌃ ⌘ F", "Enter or leave full-screen mode.", .codexApp),
        command("codexapp-review", "Review changes", "/review", "Request a review of working-tree changes.", .codexApp),
        command("codexapp-status", "Inspect status", "/status", "Show active configuration and context usage.", .codexApp),
        command("codexapp-model", "Choose model", "/model", "Change the active model.", .codexApp),
        command("codexapp-permissions", "Set permissions", "/permissions", "Adjust sandbox and approval behavior.", .codexApp),
        command("codexapp-compact", "Compact thread", "/compact", "Summarize a long thread to free context.", .codexApp)
    ]

    static let hermesAgent: [ReferenceItem] = agentCLICommands(.hermesAgent, prefix: "hermes", values: [
        "hermes", "hermes chat", "hermes --tui", "hermes --resume <session>", "hermes --continue", "hermes model",
        "hermes status", "hermes doctor", "hermes config", "hermes skills", "hermes mcp", "hermes sessions",
        "hermes gateway", "hermes dashboard", "hermes update"
    ])
    static let openClaw: [ReferenceItem] = agentCLICommands(.openClaw, prefix: "openclaw", values: [
        "openclaw --help", "openclaw --version", "openclaw setup", "openclaw onboard", "openclaw configure",
        "openclaw config", "openclaw completion", "openclaw doctor", "openclaw dashboard", "openclaw channels add",
        "openclaw gateway status", "openclaw models status", "openclaw skills list", "openclaw plugins list", "openclaw status"
    ])

    static let blender: [ReferenceItem] = [
        shortcut("blender-search", "Operator search", "F3", "Search Blender operators and menus.", .blender),
        shortcut("blender-quick", "Quick Favorites", "Q", "Open the Quick Favorites menu.", .blender),
        shortcut("blender-save", "Save file", "⌘ S", "Save the current blend file.", .blender),
        shortcut("blender-open", "Open file", "⌘ O", "Open a blend file.", .blender),
        shortcut("blender-undo", "Undo", "⌘ Z", "Undo the last operation.", .blender),
        shortcut("blender-redo", "Redo", "⌘ ⇧ Z", "Redo the last undone operation.", .blender),
        shortcut("blender-rename", "Rename", "F2", "Rename the active item.", .blender),
        shortcut("blender-adjust", "Adjust last operation", "F9", "Reopen parameters for the last action.", .blender),
        shortcut("blender-render", "Render frame", "F12", "Render the current frame.", .blender),
        shortcut("blender-render-view", "Show render", "F11", "Show the render result window.", .blender),
        shortcut("blender-maximize", "Maximize area", "⌃ Space", "Toggle maximization of the active area.", .blender),
        shortcut("blender-delete", "Delete selection", "X", "Delete selected objects with confirmation.", .blender),
        shortcut("blender-grab", "Move", "G", "Move the selection.", .blender),
        shortcut("blender-rotate", "Rotate", "R", "Rotate the selection.", .blender),
        shortcut("blender-scale", "Scale", "S", "Scale the selection.", .blender)
    ]

    static let unity: [ReferenceItem] = [
        shortcut("unity-pan", "Pan tool", "Q", "Activate the hand/pan tool.", .unity),
        shortcut("unity-move", "Move tool", "W", "Activate the move tool.", .unity),
        shortcut("unity-rotate", "Rotate tool", "E", "Activate the rotate tool.", .unity),
        shortcut("unity-scale", "Scale tool", "R", "Activate the scale tool.", .unity),
        shortcut("unity-frame", "Frame selection", "F", "Center the Scene view on the selection.", .unity),
        shortcut("unity-vertex", "Vertex snap", "V", "Hold while moving to snap vertices.", .unity),
        shortcut("unity-play", "Play", "⌘ P", "Enter or exit Play mode.", .unity),
        shortcut("unity-pause", "Pause", "⌘ ⇧ P", "Pause Play mode.", .unity),
        shortcut("unity-step", "Step frame", "⌘ ⌥ P", "Advance one frame while paused.", .unity),
        shortcut("unity-save", "Save scene", "⌘ S", "Save the active scene.", .unity),
        shortcut("unity-build", "Build", "⌘ ⇧ B", "Open or run the build workflow.", .unity),
        shortcut("unity-build-run", "Build and run", "⌘ B", "Build the project and run it.", .unity),
        shortcut("unity-duplicate", "Duplicate", "⌘ D", "Duplicate the selection.", .unity),
        shortcut("unity-console", "Open Console", "⌘ ⇧ C", "Open the Console window.", .unity),
        shortcut("unity-project", "Open Project window", "⌘ 5", "Focus the Project window.", .unity)
    ]

    static let unrealEngine: [ReferenceItem] = [
        shortcut("unreal-save", "Save current level", "⌃ S", "Save the active level.", .unrealEngine),
        shortcut("unreal-save-all", "Save all", "⌃ ⇧ S", "Save all modified assets and levels.", .unrealEngine),
        shortcut("unreal-open", "Open level", "⌃ O", "Open an existing level.", .unrealEngine),
        shortcut("unreal-new", "New level", "⌃ N", "Create a new level.", .unrealEngine),
        shortcut("unreal-content", "Content Browser", "⌃ Space", "Open or focus the Content Browser.", .unrealEngine),
        shortcut("unreal-search", "Search commands", "⌃ ⇧ P", "Open action search.", .unrealEngine, confidence: .common),
        shortcut("unreal-play", "Play in editor", "⌥ P", "Start Play In Editor.", .unrealEngine),
        shortcut("unreal-stop", "Stop play session", "Esc", "Stop the active Play In Editor session.", .unrealEngine),
        shortcut("unreal-focus", "Focus selection", "F", "Frame selected actors in the viewport.", .unrealEngine),
        shortcut("unreal-game-view", "Toggle game view", "G", "Hide or show editor-only viewport icons.", .unrealEngine),
        shortcut("unreal-translate", "Translate tool", "W", "Activate translation controls.", .unrealEngine),
        shortcut("unreal-rotate", "Rotate tool", "E", "Activate rotation controls.", .unrealEngine),
        shortcut("unreal-scale", "Scale tool", "R", "Activate scale controls.", .unrealEngine),
        shortcut("unreal-duplicate", "Duplicate actor", "⌃ W", "Duplicate selected actors.", .unrealEngine),
        shortcut("unreal-docs", "Context documentation", "F1", "Open documentation for the current editor context.", .unrealEngine)
    ]

    private static func codeOSSCommon(_ category: ReferenceCategory, prefix: String) -> [ReferenceItem] {
        [
            shortcut("\(prefix)-palette", "Command palette", "⌘ ⇧ P", "Search and run workspace actions.", category),
            shortcut("\(prefix)-quick-open", "Quick open", "⌘ P", "Open a file by name.", category),
            shortcut("\(prefix)-search", "Workspace search", "⌘ ⇧ F", "Search across workspace files.", category),
            shortcut("\(prefix)-find", "Find", "⌘ F", "Find text in the active editor.", category),
            shortcut("\(prefix)-replace", "Replace", "⌘ ⌥ F", "Find and replace in the active editor.", category),
            shortcut("\(prefix)-save", "Save", "⌘ S", "Save the active file.", category),
            shortcut("\(prefix)-new", "New file", "⌘ N", "Create a new file.", category),
            shortcut("\(prefix)-close", "Close editor", "⌘ W", "Close the active editor.", category),
            shortcut("\(prefix)-definition", "Go to definition", "F12", "Navigate to a symbol definition.", category),
            shortcut("\(prefix)-rename", "Rename symbol", "F2", "Rename the selected symbol.", category),
            shortcut("\(prefix)-terminal", "Toggle terminal", "⌃ `", "Show or hide the integrated terminal.", category),
            shortcut("\(prefix)-settings", "Open settings", "⌘ ,", "Open workspace settings.", category)
        ]
    }

    private static func agentCLICommands(_ category: ReferenceCategory, prefix: String, values: [String]) -> [ReferenceItem] {
        return values.enumerated().map { index, value in
            ReferenceItem(id: "\(prefix)-\(index)", title: value.capitalized, value: value, description: "Run this documented agent CLI action.", category: category, kind: .command)
        }
    }
}
