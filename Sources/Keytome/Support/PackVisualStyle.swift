import SwiftUI

struct PackVisualStyle {
    enum Motif { case desktop, tabs, terminal, editor, agent, graph, viewport, blueprint }
    enum Design: Hashable {
        case macOS, chrome, firefox, dia, brave, terminal, homebrew, zsh
        case vimNvim, jetBrains, visualStudio, xcode, cursor, githubCopilot
        case zed, zedAgent, windsurf, claudeCode, openAICodex, aider, junie
        case cline, warp, replit, firebaseStudio, obsidian, codexApp
        case hermesAgent, openClaw, blender, unity, unrealEngine
    }
    enum RowTreatment { case iconCards, numberedCards, commandTable, denseTable }
    enum KeycapTreatment { case glass, glow, terminal, paper, outlined }

    let accent: Color
    let secondary: Color
    let background: Color
    let surface: Color
    let motif: Motif
    let design: Design
    let rowTreatment: RowTreatment
    let keycapTreatment: KeycapTreatment
    let fontDesign: Font.Design
    let label: String

    static let index = PackVisualStyle(0x91C76B, 0x5D7FA5, 0x091016, 0x111B22, .desktop, .macOS, .iconCards, .glass, .monospaced, "KEYTOME INDEX")

    init(category: ReferenceCategory) {
        switch category {
        case .macOS: self = Self(0x5AA7FF, 0xD8E8FF, 0x0C1725, 0x17283B, .desktop, .macOS, .iconCards, .glass, .rounded, "MACOS DESKTOP")
        case .chrome: self = Self(0x4285F4, 0x34A853, 0x0D1521, 0x172438, .tabs, .chrome, .iconCards, .glass, .rounded, "CHROME DEVTOOLS")
        case .firefox: self = Self(0xA66CFF, 0xFF7139, 0x160E25, 0x25163A, .tabs, .firefox, .iconCards, .glow, .rounded, "FIREFOX TOOLBOX")
        case .dia: self = Self(0xBFA7FF, 0xEEE8FF, 0x14101E, 0x251E35, .tabs, .dia, .iconCards, .glow, .serif, "DIA WORKSPACE")
        case .brave: self = Self(0xFB542B, 0xEBA13A, 0x190D0D, 0x2A1515, .tabs, .brave, .denseTable, .outlined, .rounded, "BRAVE PRIVACY")
        case .terminal: self = Self(0x65E875, 0x45C7D8, 0x040B06, 0x0B170E, .terminal, .terminal, .commandTable, .terminal, .monospaced, "TERMINAL SESSION")
        case .homebrew: self = Self(0xF2A83A, 0xF8D9A2, 0x160E05, 0x27190B, .terminal, .homebrew, .denseTable, .paper, .rounded, "HOMEBREW CELLAR")
        case .zsh: self = Self(0x11D9E8, 0xE24FC9, 0x030A12, 0x091827, .terminal, .zsh, .iconCards, .glow, .monospaced, "ZSH POWERLINE")
        case .vimNvim: self = Self(0x72D04E, 0x4F8DFF, 0x030B08, 0x0B1813, .editor, .vimNvim, .denseTable, .terminal, .monospaced, "NEOVIM BUFFER")
        case .jetBrains: self = Self(0xFF2D92, 0x6A5CFF, 0x100811, 0x221025, .editor, .jetBrains, .iconCards, .glow, .rounded, "JETBRAINS IDE")
        case .visualStudio: self = Self(0x9B64FF, 0x5A4BFF, 0x0E0A1A, 0x1D1530, .editor, .visualStudio, .numberedCards, .glass, .rounded, "VISUAL STUDIO")
        case .xcode: self = Self(0x4DA4FF, 0x64D4FF, 0x07121D, 0x10263A, .editor, .xcode, .iconCards, .glass, .rounded, "XCODE WORKSPACE")
        case .cursor: self = Self(0xB8F2DD, 0xE9E9E9, 0x090B0B, 0x151919, .agent, .cursor, .iconCards, .outlined, .rounded, "CURSOR COMPOSER")
        case .githubCopilot: self = Self(0xA98AFF, 0x57DDF1, 0x090B18, 0x151A31, .agent, .githubCopilot, .iconCards, .glow, .rounded, "COPILOT CHAT")
        case .zed: self = Self(0xDDAF55, 0xF0E2C2, 0x100E08, 0x201B10, .editor, .zed, .iconCards, .paper, .serif, "ZED EDITOR")
        case .zedAgent: self = Self(0xC18BFF, 0xE7C56A, 0x100C12, 0x211727, .agent, .zedAgent, .numberedCards, .paper, .monospaced, "ZED AGENT")
        case .windsurf: self = Self(0x38E0C2, 0x45A9FF, 0x03111A, 0x092534, .agent, .windsurf, .iconCards, .glow, .rounded, "WINDSURF CASCADE")
        case .claudeCode: self = Self(0xD98257, 0xF1D6B7, 0x140D09, 0x281911, .terminal, .claudeCode, .numberedCards, .paper, .monospaced, "CLAUDE CODE")
        case .openAICodex: self = Self(0x8DE2B5, 0xD9F7E8, 0x030A08, 0x0A1A13, .terminal, .openAICodex, .numberedCards, .terminal, .monospaced, "OPENAI CODEX")
        case .aider: self = Self(0x80DC45, 0x25CED1, 0x020A06, 0x091A10, .terminal, .aider, .iconCards, .terminal, .monospaced, "AIDER PAIRING")
        case .junie: self = Self(0xFF3B90, 0x2FD6FF, 0x0D0810, 0x231126, .agent, .junie, .iconCards, .glow, .rounded, "JETBRAINS JUNIE")
        case .cline: self = Self(0xFF741F, 0x9EDDD1, 0x100B07, 0x21160F, .agent, .cline, .iconCards, .outlined, .rounded, "CLINE TASK")
        case .warp: self = Self(0x5797FF, 0xA45CFF, 0x020B20, 0x0A1A3A, .terminal, .warp, .iconCards, .glow, .rounded, "WARP BLOCKS")
        case .replit: self = Self(0xFF6B16, 0xFF9A50, 0x100A06, 0x25150C, .editor, .replit, .iconCards, .outlined, .rounded, "REPLIT WORKSPACE")
        case .firebaseStudio: self = Self(0xFFCA28, 0xFF7A18, 0x081523, 0x10283B, .editor, .firebaseStudio, .iconCards, .glass, .rounded, "FIREBASE STUDIO")
        case .obsidian: self = Self(0xA77BFF, 0xD8C5FF, 0x0C0914, 0x1B1329, .graph, .obsidian, .iconCards, .glow, .rounded, "OBSIDIAN GRAPH")
        case .codexApp: self = Self(0x9BE4C5, 0xE7F8F1, 0x07100E, 0x13221D, .agent, .codexApp, .denseTable, .glass, .rounded, "CODEX DESKTOP")
        case .hermesAgent: self = Self(0xDDB65B, 0x70C36A, 0x0D0B04, 0x211B0C, .agent, .hermesAgent, .numberedCards, .paper, .serif, "HERMES GATEWAY")
        case .openClaw: self = Self(0xF05252, 0xFF8B78, 0x100606, 0x241010, .agent, .openClaw, .numberedCards, .outlined, .rounded, "OPENCLAW OPERATOR")
        case .blender: self = Self(0xF57922, 0x4C8DFF, 0x0C1015, 0x1B232C, .viewport, .blender, .iconCards, .outlined, .rounded, "BLENDER VIEWPORT")
        case .unity: self = Self(0x34BDEB, 0xE7F8FF, 0x0A1116, 0x17242C, .viewport, .unity, .iconCards, .glow, .rounded, "UNITY SCENE")
        case .unrealEngine: self = Self(0x2E9DFF, 0x76D7FF, 0x03101F, 0x0A2440, .blueprint, .unrealEngine, .iconCards, .glow, .rounded, "UNREAL BLUEPRINT")
        }
    }

    private init(_ accent: UInt, _ secondary: UInt, _ background: UInt, _ surface: UInt, _ motif: Motif, _ design: Design, _ rowTreatment: RowTreatment, _ keycapTreatment: KeycapTreatment, _ fontDesign: Font.Design, _ label: String) {
        self.accent = Color(hex: accent); self.secondary = Color(hex: secondary)
        self.background = Color(hex: background); self.surface = Color(hex: surface)
        self.motif = motif; self.design = design; self.rowTreatment = rowTreatment
        self.keycapTreatment = keycapTreatment; self.fontDesign = fontDesign; self.label = label
    }
}

private extension Color {
    init(hex: UInt) {
        self.init(red: Double((hex >> 16) & 255) / 255, green: Double((hex >> 8) & 255) / 255, blue: Double(hex & 255) / 255)
    }
}

struct PackDesignBackground: View {
    @AppStorage(AppearancePreferences.glassEnabledKey) private var glassEnabled = false
    @Environment(\.accessibilityReduceTransparency) private var reduceTransparency

    let style: PackVisualStyle

    var body: some View {
        Canvas { context, size in
            let opacity = glassEnabled && !reduceTransparency ? 0.72 : 1.0
            context.fill(Path(CGRect(origin: .zero, size: size)), with: .color(style.background.opacity(opacity)))
            switch style.motif {
            case .graph: graph(&context, size)
            case .viewport: grid(&context, size, perspective: true)
            case .blueprint: grid(&context, size, perspective: false); nodes(&context, size)
            case .terminal: scanlines(&context, size)
            case .editor: editor(&context, size)
            case .agent: orbits(&context, size)
            case .tabs: tabs(&context, size)
            case .desktop: grid(&context, size, perspective: false)
            }
        }
        .allowsHitTesting(false)
        .accessibilityHidden(true)
    }

    private func line(_ context: inout GraphicsContext, _ a: CGPoint, _ b: CGPoint, opacity: Double = 0.08) {
        var path = Path(); path.move(to: a); path.addLine(to: b)
        context.stroke(path, with: .color(style.accent.opacity(opacity)), lineWidth: 1)
    }
    private func scanlines(_ c: inout GraphicsContext, _ s: CGSize) { for y in stride(from: 0.0, through: s.height, by: 16) { line(&c, .init(x: 0, y: y), .init(x: s.width, y: y), opacity: 0.045) } }
    private func tabs(_ c: inout GraphicsContext, _ s: CGSize) { for x in stride(from: 20.0, through: s.width, by: 150) { c.fill(Path(roundedRect: .init(x: x, y: 18, width: 105, height: 20), cornerRadius: 8), with: .color(style.accent.opacity(0.07))) } }
    private func editor(_ c: inout GraphicsContext, _ s: CGSize) { for y in stride(from: 28.0, through: s.height, by: 28) { c.fill(Path(roundedRect: .init(x: 22, y: y, width: Double(Int(y).isMultiple(of: 3) ? 210 : 130), height: 3), cornerRadius: 1), with: .color(style.secondary.opacity(0.055))) } }
    private func orbits(_ c: inout GraphicsContext, _ s: CGSize) { let p = CGPoint(x: s.width * 0.84, y: s.height * 0.24); for r in [40.0, 78.0, 120.0] { c.stroke(Path(ellipseIn: .init(x: p.x-r, y: p.y-r, width: r*2, height: r*2)), with: .color(style.accent.opacity(0.07)), lineWidth: 1) } }
    private func grid(_ c: inout GraphicsContext, _ s: CGSize, perspective: Bool) { let h = perspective ? s.height * 0.4 : 0; for x in stride(from: 0.0, through: s.width, by: 42) { line(&c, .init(x: perspective ? s.width/2 : x, y: h), .init(x: x, y: s.height), opacity: 0.05) }; for y in stride(from: h, through: s.height, by: 34) { line(&c, .init(x: 0, y: y), .init(x: s.width, y: y), opacity: 0.05) } }
    private func nodes(_ c: inout GraphicsContext, _ s: CGSize) { for r in [CGRect(x: s.width*0.66, y: 58, width: 116, height: 54), CGRect(x: s.width*0.80, y: 190, width: 130, height: 58)] { c.fill(Path(roundedRect: r, cornerRadius: 7), with: .color(style.surface.opacity(0.55))); c.stroke(Path(roundedRect: r, cornerRadius: 7), with: .color(style.accent.opacity(0.2)), lineWidth: 1) } }
    private func graph(_ c: inout GraphicsContext, _ s: CGSize) { let p = [CGPoint(x:s.width*0.15,y:s.height*0.18),CGPoint(x:s.width*0.4,y:s.height*0.3),CGPoint(x:s.width*0.72,y:s.height*0.14),CGPoint(x:s.width*0.86,y:s.height*0.48),CGPoint(x:s.width*0.55,y:s.height*0.72),CGPoint(x:s.width*0.22,y:s.height*0.63)]; for i in 0..<p.count { line(&c,p[i],p[(i+1)%p.count],opacity:0.12); c.fill(Path(ellipseIn:.init(x:p[i].x-3,y:p[i].y-3,width:6,height:6)),with:.color(style.accent.opacity(0.35))) } }
}
