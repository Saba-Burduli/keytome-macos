import SwiftUI

struct PackHeroArtwork: View {
    let style: PackVisualStyle
    let symbol: String

    var body: some View {
        Canvas { context, size in
            glow(&context, size)
            switch style.design {
            case .macOS: macOS(&context, size)
            case .chrome: chrome(&context, size)
            case .firefox: firefox(&context, size)
            case .dia: dia(&context, size)
            case .brave: brave(&context, size)
            case .terminal: terminal(&context, size)
            case .homebrew: homebrew(&context, size)
            case .zsh: zsh(&context, size)
            case .vimNvim: vimNvim(&context, size)
            case .jetBrains: jetBrains(&context, size)
            case .visualStudio: visualStudio(&context, size)
            case .xcode: xcode(&context, size)
            case .cursor: cursor(&context, size)
            case .githubCopilot: githubCopilot(&context, size)
            case .zed: zed(&context, size)
            case .zedAgent: zedAgent(&context, size)
            case .windsurf: windsurf(&context, size)
            case .claudeCode: claudeCode(&context, size)
            case .openAICodex: openAICodex(&context, size)
            case .aider: aider(&context, size)
            case .junie: junie(&context, size)
            case .cline: cline(&context, size)
            case .warp: warp(&context, size)
            case .replit: replit(&context, size)
            case .firebaseStudio: firebaseStudio(&context, size)
            case .obsidian: obsidian(&context, size)
            case .codexApp: codexApp(&context, size)
            case .hermesAgent: hermesAgent(&context, size)
            case .openClaw: openClaw(&context, size)
            case .blender: blender(&context, size)
            case .unity: unity(&context, size)
            case .unrealEngine: unrealEngine(&context, size)
            }

            if let resolved = context.resolveSymbol(id: "mark") {
                context.draw(resolved, at: CGPoint(x: size.width * 0.78, y: size.height * 0.42), anchor: .center)
            }
        } symbols: {
            Image(systemName: symbol)
                .font(.system(size: 44, weight: .semibold))
                .foregroundStyle(style.accent.opacity(0.86))
                .shadow(color: style.accent.opacity(0.42), radius: 18)
                .tag("mark")
        }
        .accessibilityHidden(true)
    }

    private func glow(_ c: inout GraphicsContext, _ s: CGSize) {
        c.fill(
            Path(ellipseIn: CGRect(x: s.width * 0.22, y: -s.height * 0.34, width: s.width * 0.95, height: s.height * 1.15)),
            with: .radialGradient(
                Gradient(colors: [style.accent.opacity(0.34), style.secondary.opacity(0.12), .clear]),
                center: CGPoint(x: s.width * 0.72, y: s.height * 0.18),
                startRadius: 8,
                endRadius: s.width * 0.68
            )
        )
    }

    private func line(_ c: inout GraphicsContext, _ a: CGPoint, _ b: CGPoint, _ color: Color? = nil, opacity: Double = 0.2, width: CGFloat = 1) {
        var path = Path()
        path.move(to: a)
        path.addLine(to: b)
        c.stroke(path, with: .color((color ?? style.accent).opacity(opacity)), lineWidth: width)
    }

    private func rounded(_ c: inout GraphicsContext, _ rect: CGRect, radius: CGFloat = 10, fill: Color? = nil, strokeOpacity: Double = 0.2) {
        let path = Path(roundedRect: rect, cornerRadius: radius)
        c.fill(path, with: .color((fill ?? style.surface).opacity(0.5)))
        c.stroke(path, with: .color(style.accent.opacity(strokeOpacity)), lineWidth: 1)
    }

    // Each pack deliberately owns a separate composition. Shared primitives keep
    // the drawing cheap, while these functions translate the individual concepts.
    private func macOS(_ c: inout GraphicsContext, _ s: CGSize) {
        desktop(&c, s)
        line(&c, CGPoint(x: s.width * 0.62, y: s.height * 0.58), CGPoint(x: s.width * 0.95, y: s.height * 0.58), style.secondary, opacity: 0.16, width: 2)
    }

    private func chrome(_ c: inout GraphicsContext, _ s: CGSize) {
        browser(&c, s, fiery: false)
        for (index, color) in [Color.red, .yellow, .green, .blue].enumerated() {
            let start = Angle.degrees(Double(index) * 90 + 6)
            c.stroke(Path { $0.addArc(center: CGPoint(x: s.width * 0.82, y: s.height * 0.46), radius: 45, startAngle: start, endAngle: start + .degrees(66), clockwise: false) }, with: .color(color.opacity(0.58)), lineWidth: 7)
        }
    }

    private func firefox(_ c: inout GraphicsContext, _ s: CGSize) {
        browser(&c, s, fiery: true)
        var flame = Path()
        flame.move(to: CGPoint(x: s.width * 0.67, y: s.height * 0.72))
        flame.addCurve(to: CGPoint(x: s.width * 0.9, y: s.height * 0.17), control1: CGPoint(x: s.width * 0.58, y: s.height * 0.42), control2: CGPoint(x: s.width * 0.78, y: s.height * 0.38))
        flame.addCurve(to: CGPoint(x: s.width * 0.78, y: s.height * 0.7), control1: CGPoint(x: s.width * 0.98, y: s.height * 0.48), control2: CGPoint(x: s.width * 0.92, y: s.height * 0.66))
        c.stroke(flame, with: .linearGradient(Gradient(colors: [style.secondary, style.accent]), startPoint: .zero, endPoint: CGPoint(x: s.width, y: s.height)), lineWidth: 10)
    }

    private func dia(_ c: inout GraphicsContext, _ s: CGSize) {
        for i in 0..<3 {
            rounded(&c, CGRect(x: s.width * (0.48 + CGFloat(i) * 0.09), y: s.height * (0.18 + CGFloat(i) * 0.07), width: 106, height: 82), radius: 14, fill: i.isMultiple(of: 2) ? style.accent : style.secondary, strokeOpacity: 0.42)
        }
        for r in [28.0, 58.0, 92.0] {
            c.stroke(Path(ellipseIn: CGRect(x: s.width * 0.75 - r, y: s.height * 0.52 - r / 2, width: r * 2, height: r)), with: .color(style.accent.opacity(0.12)), lineWidth: 1)
        }
    }

    private func brave(_ c: inout GraphicsContext, _ s: CGSize) {
        shield(&c, s)
        for i in 0..<9 {
            let x = s.width * (0.46 + CGFloat(i % 3) * 0.13)
            let y = s.height * (0.12 + CGFloat(i / 3) * 0.16)
            var facet = Path(); facet.move(to: CGPoint(x: x, y: y)); facet.addLine(to: CGPoint(x: x + 48, y: y + 14)); facet.addLine(to: CGPoint(x: x + 18, y: y + 54)); facet.closeSubpath()
            c.fill(facet, with: .color((i.isMultiple(of: 2) ? style.accent : style.secondary).opacity(0.12 + Double(i) * 0.012)))
        }
    }

    private func homebrew(_ c: inout GraphicsContext, _ s: CGSize) {
        tavern(&c, s)
        for x in [s.width * 0.58, s.width * 0.78] {
            c.stroke(Path(ellipseIn: CGRect(x: x, y: s.height * 0.22, width: 58, height: 94)), with: .color(style.secondary.opacity(0.28)), lineWidth: 4)
            line(&c, CGPoint(x: x, y: s.height * 0.48), CGPoint(x: x + 58, y: s.height * 0.48), style.accent, opacity: 0.34, width: 3)
        }
    }

    private func zsh(_ c: inout GraphicsContext, _ s: CGSize) {
        shell(&c, s)
        powerline(&c, s, y: 0.18)
        powerline(&c, s, y: 0.72)
    }

    private func vimNvim(_ c: inout GraphicsContext, _ s: CGSize) {
        ide(&c, s, split: false)
        for i in 0..<4 {
            rounded(&c, CGRect(x: s.width * 0.12 + CGFloat(i) * 60, y: s.height * 0.76, width: 48, height: 18), radius: 3, fill: i == 0 ? style.accent : style.background, strokeOpacity: 0.32)
        }
        line(&c, CGPoint(x: s.width * 0.82, y: s.height * 0.18), CGPoint(x: s.width * 0.9, y: s.height * 0.72), style.accent, opacity: 0.28, width: 4)
    }

    private func jetBrains(_ c: inout GraphicsContext, _ s: CGSize) {
        ide(&c, s, split: true)
        for i in 0..<5 {
            let color = i.isMultiple(of: 2) ? style.accent : style.secondary
            rounded(&c, CGRect(x: s.width * 0.48 + CGFloat(i) * 34, y: s.height * 0.68 - CGFloat(i % 2) * 22, width: 42, height: 18), radius: 3, fill: color, strokeOpacity: 0.36)
        }
    }

    private func visualStudio(_ c: inout GraphicsContext, _ s: CGSize) {
        ide(&c, s, split: true)
        var ribbon = Path(); ribbon.move(to: CGPoint(x: s.width * 0.57, y: s.height * 0.24)); ribbon.addLine(to: CGPoint(x: s.width * 0.84, y: s.height * 0.48)); ribbon.addLine(to: CGPoint(x: s.width * 0.57, y: s.height * 0.72)); ribbon.addLine(to: CGPoint(x: s.width * 0.68, y: s.height * 0.48)); ribbon.closeSubpath()
        c.stroke(ribbon, with: .color(style.accent.opacity(0.5)), lineWidth: 8)
    }

    private func xcode(_ c: inout GraphicsContext, _ s: CGSize) {
        ide(&c, s, split: true)
        rounded(&c, CGRect(x: s.width * 0.16, y: s.height * 0.17, width: s.width * 0.62, height: 16), radius: 4, fill: style.background, strokeOpacity: 0.18)
        for x in stride(from: s.width * 0.18, through: s.width * 0.72, by: 38) {
            c.fill(Path(ellipseIn: CGRect(x: x, y: s.height * 0.19, width: 4, height: 4)), with: .color(style.secondary.opacity(0.45)))
        }
    }

    private func cursor(_ c: inout GraphicsContext, _ s: CGSize) {
        ide(&c, s, split: true)
        rounded(&c, CGRect(x: s.width * 0.53, y: s.height * 0.52, width: s.width * 0.3, height: s.height * 0.22), radius: 8, fill: .black, strokeOpacity: 0.3)
        var pointer = Path(); pointer.move(to: CGPoint(x: s.width * 0.84, y: s.height * 0.18)); pointer.addLine(to: CGPoint(x: s.width * 0.9, y: s.height * 0.45)); pointer.addLine(to: CGPoint(x: s.width * 0.81, y: s.height * 0.39)); pointer.closeSubpath()
        c.stroke(pointer, with: .color(style.secondary.opacity(0.58)), lineWidth: 2)
    }

    private func githubCopilot(_ c: inout GraphicsContext, _ s: CGSize) {
        assistant(&c, s)
        robot(&c, s, center: CGPoint(x: s.width * 0.78, y: s.height * 0.32))
        rounded(&c, CGRect(x: s.width * 0.64, y: s.height * 0.58, width: s.width * 0.27, height: 34), radius: 9, fill: style.accent, strokeOpacity: 0.32)
    }

    private func zed(_ c: inout GraphicsContext, _ s: CGSize) {
        ide(&c, s, split: true)
        for i in 0..<3 {
            rounded(&c, CGRect(x: s.width * 0.12, y: s.height * (0.22 + Double(i) * 0.18), width: s.width * 0.18, height: 42), radius: 3, fill: style.secondary, strokeOpacity: 0.22)
        }
        line(&c, CGPoint(x: s.width * 0.48, y: s.height * 0.16), CGPoint(x: s.width * 0.48, y: s.height * 0.78), style.accent, opacity: 0.26)
    }

    private func zedAgent(_ c: inout GraphicsContext, _ s: CGSize) {
        assistant(&c, s)
        for i in 0..<5 { numberedBadge(&c, s, index: i, x: 0.48, y: 0.18 + Double(i) * 0.12) }
        robot(&c, s, center: CGPoint(x: s.width * 0.82, y: s.height * 0.25))
    }

    private func windsurf(_ c: inout GraphicsContext, _ s: CGSize) {
        assistant(&c, s)
        wave(&c, s, startY: 0.64)
        for i in 0..<3 { rounded(&c, CGRect(x: s.width * (0.1 + CGFloat(i) * 0.17), y: s.height * 0.2, width: 58, height: 24), radius: 7, fill: i.isMultiple(of: 2) ? style.accent : style.secondary, strokeOpacity: 0.26) }
    }

    private func claudeCode(_ c: inout GraphicsContext, _ s: CGSize) {
        rounded(&c, CGRect(x: s.width * 0.15, y: s.height * 0.14, width: s.width * 0.22, height: s.height * 0.64), radius: 6, fill: style.surface, strokeOpacity: 0.14)
        terminal(&c, s)
        for i in 0..<5 { numberedBadge(&c, s, index: i, x: 0.52, y: 0.19 + Double(i) * 0.105) }
    }

    private func openAICodex(_ c: inout GraphicsContext, _ s: CGSize) {
        terminal(&c, s)
        for i in 0..<5 { numberedBadge(&c, s, index: i, x: 0.18, y: 0.2 + Double(i) * 0.1) }
        graphLine(&c, s)
    }

    private func aider(_ c: inout GraphicsContext, _ s: CGSize) {
        shell(&c, s)
        robot(&c, s, center: CGPoint(x: s.width * 0.22, y: s.height * 0.66))
        gitBranch(&c, s)
    }

    private func junie(_ c: inout GraphicsContext, _ s: CGSize) {
        assistant(&c, s)
        cubes(&c, s, origin: CGPoint(x: s.width * 0.62, y: s.height * 0.22), count: 7)
        robot(&c, s, center: CGPoint(x: s.width * 0.79, y: s.height * 0.35))
    }

    private func cline(_ c: inout GraphicsContext, _ s: CGSize) {
        operatorPanel(&c, s)
        timeline(&c, s, x: 0.83)
        robot(&c, s, center: CGPoint(x: s.width * 0.77, y: s.height * 0.22))
    }

    private func warp(_ c: inout GraphicsContext, _ s: CGSize) {
        terminal(&c, s)
        wave(&c, s, startY: 0.24)
        rounded(&c, CGRect(x: s.width * 0.67, y: s.height * 0.45, width: s.width * 0.26, height: s.height * 0.24), radius: 10, fill: style.surface, strokeOpacity: 0.4)
    }

    private func replit(_ c: inout GraphicsContext, _ s: CGSize) {
        creative(&c, s)
        cubes(&c, s, origin: CGPoint(x: s.width * 0.56, y: s.height * 0.2), count: 9)
    }

    private func firebaseStudio(_ c: inout GraphicsContext, _ s: CGSize) {
        ide(&c, s, split: true)
        flame(&c, s, center: CGPoint(x: s.width * 0.78, y: s.height * 0.46))
        rounded(&c, CGRect(x: s.width * 0.62, y: s.height * 0.65, width: 82, height: 28), radius: 6, fill: style.accent, strokeOpacity: 0.3)
    }

    private func obsidian(_ c: inout GraphicsContext, _ s: CGSize) {
        graph(&c, s)
        crystal(&c, s, center: CGPoint(x: s.width * 0.76, y: s.height * 0.4))
        crystal(&c, s, center: CGPoint(x: s.width * 0.22, y: s.height * 0.68), scale: 0.48)
    }

    private func codexApp(_ c: inout GraphicsContext, _ s: CGSize) {
        ide(&c, s, split: true)
        rounded(&c, CGRect(x: s.width * 0.1, y: s.height * 0.16, width: s.width * 0.17, height: s.height * 0.61), radius: 8, fill: style.background, strokeOpacity: 0.2)
        for i in 0..<5 { line(&c, CGPoint(x: s.width * 0.47, y: s.height * (0.26 + Double(i) * 0.08)), CGPoint(x: s.width * (0.66 + Double(i % 2) * 0.12), y: s.height * (0.26 + Double(i) * 0.08)), i.isMultiple(of: 2) ? .green : .red, opacity: 0.26, width: 2) }
    }

    private func hermesAgent(_ c: inout GraphicsContext, _ s: CGSize) {
        mythic(&c, s)
        arch(&c, s)
        wing(&c, s, center: CGPoint(x: s.width * 0.78, y: s.height * 0.34))
    }

    private func openClaw(_ c: inout GraphicsContext, _ s: CGSize) {
        operatorPanel(&c, s)
        timeline(&c, s, x: 0.84)
        for i in 0..<4 {
            var claw = Path(); claw.move(to: CGPoint(x: s.width * (0.62 + CGFloat(i) * 0.055), y: s.height * 0.16)); claw.addCurve(to: CGPoint(x: s.width * (0.55 + CGFloat(i) * 0.04), y: s.height * 0.52), control1: CGPoint(x: s.width * (0.75 + CGFloat(i) * 0.03), y: s.height * 0.22), control2: CGPoint(x: s.width * (0.62 + CGFloat(i) * 0.02), y: s.height * 0.42)); c.stroke(claw, with: .color(style.accent.opacity(0.24 + Double(i) * 0.06)), lineWidth: 2)
        }
    }

    private func blender(_ c: inout GraphicsContext, _ s: CGSize) {
        creative(&c, s)
        axes(&c, s, center: CGPoint(x: s.width * 0.74, y: s.height * 0.46))
        wireCube(&c, s, origin: CGPoint(x: s.width * 0.56, y: s.height * 0.25), size: 62)
    }

    private func unity(_ c: inout GraphicsContext, _ s: CGSize) {
        game(&c, s)
        axes(&c, s, center: CGPoint(x: s.width * 0.62, y: s.height * 0.46))
        rounded(&c, CGRect(x: s.width * 0.78, y: s.height * 0.16, width: s.width * 0.17, height: s.height * 0.56), radius: 6, fill: style.surface, strokeOpacity: 0.24)
    }

    private func unrealEngine(_ c: inout GraphicsContext, _ s: CGSize) {
        blueprint(&c, s)
        for i in 0..<3 { rounded(&c, CGRect(x: s.width * (0.54 + CGFloat(i) * 0.11), y: s.height * (0.2 + CGFloat(i % 2) * 0.2), width: 72, height: 34), radius: 6, fill: style.surface, strokeOpacity: 0.48) }
    }

    private func desktop(_ c: inout GraphicsContext, _ s: CGSize) {
        for y in stride(from: s.height * 0.58, through: s.height, by: 16) {
            line(&c, CGPoint(x: 0, y: y), CGPoint(x: s.width, y: y), style.secondary, opacity: 0.07)
        }
        var coast = Path()
        coast.move(to: CGPoint(x: 0, y: s.height * 0.66))
        coast.addCurve(to: CGPoint(x: s.width, y: s.height * 0.46), control1: CGPoint(x: s.width * 0.3, y: s.height * 0.48), control2: CGPoint(x: s.width * 0.65, y: s.height * 0.7))
        coast.addLine(to: CGPoint(x: s.width, y: s.height))
        coast.addLine(to: CGPoint(x: 0, y: s.height))
        c.fill(coast, with: .linearGradient(Gradient(colors: [style.surface.opacity(0.5), style.background.opacity(0.92)]), startPoint: .zero, endPoint: CGPoint(x: s.width, y: s.height)))
        rounded(&c, CGRect(x: s.width * 0.72, y: s.height * 0.22, width: 28, height: 70), radius: 5, fill: style.secondary, strokeOpacity: 0.36)
        c.fill(Path(ellipseIn: CGRect(x: s.width * 0.69, y: s.height * 0.13, width: 44, height: 28)), with: .color(Color.yellow.opacity(0.42)))
    }

    private func browser(_ c: inout GraphicsContext, _ s: CGSize, fiery: Bool) {
        rounded(&c, CGRect(x: s.width * 0.18, y: s.height * 0.18, width: s.width * 0.58, height: s.height * 0.48), radius: 12)
        for i in 0..<4 {
            line(&c, CGPoint(x: s.width * 0.24, y: s.height * (0.32 + Double(i) * 0.08)), CGPoint(x: s.width * (0.55 + Double(i) * 0.04), y: s.height * (0.32 + Double(i) * 0.08)), fiery ? style.secondary : style.accent, opacity: 0.28, width: 2)
        }
        c.stroke(Path(ellipseIn: CGRect(x: s.width * 0.58, y: s.height * 0.22, width: s.width * 0.34, height: s.width * 0.34)), with: .color((fiery ? style.secondary : style.accent).opacity(0.5)), lineWidth: 18)
    }

    private func shield(_ c: inout GraphicsContext, _ s: CGSize) {
        for i in 0..<8 {
            let x = s.width * CGFloat(i) / 7
            line(&c, CGPoint(x: x, y: 0), CGPoint(x: s.width - x * 0.4, y: s.height), style.secondary, opacity: 0.09)
        }
        var path = Path()
        path.move(to: CGPoint(x: s.width * 0.68, y: s.height * 0.16))
        path.addLine(to: CGPoint(x: s.width * 0.86, y: s.height * 0.26))
        path.addLine(to: CGPoint(x: s.width * 0.8, y: s.height * 0.62))
        path.addLine(to: CGPoint(x: s.width * 0.68, y: s.height * 0.76))
        path.addLine(to: CGPoint(x: s.width * 0.56, y: s.height * 0.62))
        path.addLine(to: CGPoint(x: s.width * 0.5, y: s.height * 0.26))
        path.closeSubpath()
        c.stroke(path, with: .color(style.accent.opacity(0.55)), lineWidth: 3)
    }

    private func terminal(_ c: inout GraphicsContext, _ s: CGSize) {
        rounded(&c, CGRect(x: s.width * 0.22, y: s.height * 0.18, width: s.width * 0.54, height: s.height * 0.54), radius: 11)
        for i in 0..<6 {
            line(&c, CGPoint(x: s.width * 0.29, y: s.height * (0.3 + Double(i) * 0.065)), CGPoint(x: s.width * (0.55 + Double(i).truncatingRemainder(dividingBy: 2) * 0.1), y: s.height * (0.3 + Double(i) * 0.065)), style.accent, opacity: 0.26)
        }
        prompt(&c, s)
    }

    private func tavern(_ c: inout GraphicsContext, _ s: CGSize) {
        for i in 0..<4 {
            rounded(&c, CGRect(x: s.width * 0.08 + CGFloat(i) * 45, y: s.height * 0.2, width: 26, height: 78), radius: 6, fill: style.secondary, strokeOpacity: 0.14)
        }
        c.stroke(Path(ellipseIn: CGRect(x: s.width * 0.62, y: s.height * 0.22, width: 94, height: 94)), with: .color(style.accent.opacity(0.34)), lineWidth: 6)
        prompt(&c, s)
    }

    private func shell(_ c: inout GraphicsContext, _ s: CGSize) {
        for i in 0..<5 {
            line(&c, CGPoint(x: s.width * 0.12, y: s.height * (0.2 + Double(i) * 0.13)), CGPoint(x: s.width * 0.88, y: s.height * (0.05 + Double(i) * 0.13)), i.isMultiple(of: 2) ? style.accent : style.secondary, opacity: 0.16)
        }
        prompt(&c, s)
    }

    private func ide(_ c: inout GraphicsContext, _ s: CGSize, split: Bool) {
        rounded(&c, CGRect(x: s.width * 0.12, y: s.height * 0.14, width: s.width * 0.72, height: s.height * 0.62), radius: 10)
        if split { line(&c, CGPoint(x: s.width * 0.38, y: s.height * 0.16), CGPoint(x: s.width * 0.38, y: s.height * 0.74), style.secondary, opacity: 0.18) }
        for i in 0..<8 {
            line(&c, CGPoint(x: s.width * (split ? 0.43 : 0.2), y: s.height * (0.25 + Double(i) * 0.055)), CGPoint(x: s.width * (0.58 + Double(i % 3) * 0.07), y: s.height * (0.25 + Double(i) * 0.055)), i.isMultiple(of: 3) ? style.accent : style.secondary, opacity: 0.22)
        }
    }

    private func assistant(_ c: inout GraphicsContext, _ s: CGSize) {
        for (i, rect) in [
            CGRect(x: s.width * 0.2, y: s.height * 0.22, width: s.width * 0.42, height: 36),
            CGRect(x: s.width * 0.36, y: s.height * 0.43, width: s.width * 0.46, height: 44),
            CGRect(x: s.width * 0.16, y: s.height * 0.64, width: s.width * 0.34, height: 34)
        ].enumerated() {
            rounded(&c, rect, radius: 12, fill: i.isMultiple(of: 2) ? style.surface : style.accent, strokeOpacity: 0.24)
        }
        for r in [30.0, 58.0, 88.0] {
            c.stroke(Path(ellipseIn: CGRect(x: s.width * 0.72 - r, y: s.height * 0.34 - r, width: r * 2, height: r * 2)), with: .color(style.secondary.opacity(0.12)), lineWidth: 1)
        }
    }

    private func graph(_ c: inout GraphicsContext, _ s: CGSize) {
        let points = [
            CGPoint(x: s.width * 0.24, y: s.height * 0.32),
            CGPoint(x: s.width * 0.48, y: s.height * 0.22),
            CGPoint(x: s.width * 0.74, y: s.height * 0.36),
            CGPoint(x: s.width * 0.64, y: s.height * 0.68),
            CGPoint(x: s.width * 0.32, y: s.height * 0.62)
        ]
        for i in points.indices { line(&c, points[i], points[(i + 1) % points.count], style.secondary, opacity: 0.22) }
        for point in points {
            c.fill(Path(ellipseIn: CGRect(x: point.x - 7, y: point.y - 7, width: 14, height: 14)), with: .color(style.accent.opacity(0.48)))
        }
    }

    private func mythic(_ c: inout GraphicsContext, _ s: CGSize) {
        c.stroke(Path(ellipseIn: CGRect(x: s.width * 0.52, y: s.height * 0.1, width: s.height * 0.7, height: s.height * 0.7)), with: .color(style.secondary.opacity(0.32)), lineWidth: 2)
        for i in 0..<7 {
            line(&c, CGPoint(x: s.width * 0.18 + CGFloat(i) * 34, y: s.height * 0.2), CGPoint(x: s.width * 0.2 + CGFloat(i) * 20, y: s.height * 0.82), style.accent, opacity: 0.1)
        }
    }

    private func operatorPanel(_ c: inout GraphicsContext, _ s: CGSize) {
        rounded(&c, CGRect(x: s.width * 0.18, y: s.height * 0.18, width: s.width * 0.56, height: s.height * 0.54), radius: 12)
        for i in 0..<4 {
            rounded(&c, CGRect(x: s.width * 0.24, y: s.height * (0.27 + Double(i) * 0.11), width: s.width * 0.42, height: 20), radius: 5, fill: style.background, strokeOpacity: 0.16)
        }
    }

    private func creative(_ c: inout GraphicsContext, _ s: CGSize) {
        for i in 0..<5 {
            let rect = CGRect(x: s.width * (0.5 + CGFloat(i % 2) * 0.12), y: s.height * (0.18 + CGFloat(i) * 0.1), width: 52, height: 52)
            rounded(&c, rect, radius: 8, fill: i.isMultiple(of: 2) ? style.accent : style.secondary, strokeOpacity: 0.22)
        }
        grid(&c, s)
    }

    private func game(_ c: inout GraphicsContext, _ s: CGSize) {
        grid(&c, s)
        var castle = Path()
        castle.move(to: CGPoint(x: s.width * 0.62, y: s.height * 0.72))
        castle.addLine(to: CGPoint(x: s.width * 0.68, y: s.height * 0.32))
        castle.addLine(to: CGPoint(x: s.width * 0.75, y: s.height * 0.72))
        castle.closeSubpath()
        c.stroke(castle, with: .color(style.accent.opacity(0.52)), lineWidth: 3)
    }

    private func blueprint(_ c: inout GraphicsContext, _ s: CGSize) {
        grid(&c, s)
        for rect in [
            CGRect(x: s.width * 0.16, y: s.height * 0.25, width: 90, height: 42),
            CGRect(x: s.width * 0.58, y: s.height * 0.48, width: 110, height: 50)
        ] {
            rounded(&c, rect, radius: 8, fill: style.surface, strokeOpacity: 0.38)
        }
        line(&c, CGPoint(x: s.width * 0.36, y: s.height * 0.36), CGPoint(x: s.width * 0.58, y: s.height * 0.53), style.accent, opacity: 0.32, width: 2)
    }

    private func powerline(_ c: inout GraphicsContext, _ s: CGSize, y: CGFloat) {
        var x = s.width * 0.12
        for i in 0..<4 {
            var segment = Path()
            segment.move(to: CGPoint(x: x, y: s.height * y))
            segment.addLine(to: CGPoint(x: x + 62, y: s.height * y))
            segment.addLine(to: CGPoint(x: x + 74, y: s.height * y + 11))
            segment.addLine(to: CGPoint(x: x + 62, y: s.height * y + 22))
            segment.addLine(to: CGPoint(x: x, y: s.height * y + 22))
            segment.closeSubpath()
            c.fill(segment, with: .color((i.isMultiple(of: 2) ? style.accent : style.secondary).opacity(0.2)))
            x += 68
        }
    }

    private func robot(_ c: inout GraphicsContext, _ s: CGSize, center: CGPoint) {
        let face = CGRect(x: center.x - 34, y: center.y - 24, width: 68, height: 48)
        rounded(&c, face, radius: 16, fill: style.background, strokeOpacity: 0.62)
        for offset in [-14.0, 14.0] {
            c.fill(Path(ellipseIn: CGRect(x: center.x + offset - 5, y: center.y - 4, width: 10, height: 10)), with: .color(style.secondary.opacity(0.82)))
        }
        line(&c, CGPoint(x: center.x, y: center.y - 24), CGPoint(x: center.x, y: center.y - 36), style.accent, opacity: 0.62, width: 2)
        c.fill(Path(ellipseIn: CGRect(x: center.x - 3, y: center.y - 41, width: 6, height: 6)), with: .color(style.accent.opacity(0.82)))
    }

    private func numberedBadge(_ c: inout GraphicsContext, _ s: CGSize, index: Int, x: CGFloat, y: CGFloat) {
        let point = CGPoint(x: s.width * x, y: s.height * y)
        c.fill(Path(ellipseIn: CGRect(x: point.x, y: point.y, width: 20, height: 20)), with: .color(style.accent.opacity(0.26)))
        rounded(&c, CGRect(x: point.x + 28, y: point.y, width: 96 + CGFloat(index % 2) * 24, height: 20), radius: 5, fill: style.surface, strokeOpacity: 0.16)
    }

    private func wave(_ c: inout GraphicsContext, _ s: CGSize, startY: CGFloat) {
        for layer in 0..<5 {
            var path = Path()
            path.move(to: CGPoint(x: s.width * 0.32, y: s.height * startY + CGFloat(layer) * 5))
            path.addCurve(
                to: CGPoint(x: s.width * 0.96, y: s.height * (startY - 0.22) + CGFloat(layer) * 4),
                control1: CGPoint(x: s.width * 0.52, y: s.height * (startY + 0.18)),
                control2: CGPoint(x: s.width * 0.72, y: s.height * (startY - 0.28))
            )
            c.stroke(path, with: .color((layer.isMultiple(of: 2) ? style.accent : style.secondary).opacity(0.14 + Double(layer) * 0.035)), lineWidth: 1.5)
        }
    }

    private func graphLine(_ c: inout GraphicsContext, _ s: CGSize) {
        let points = [CGPoint(x: s.width * 0.18, y: s.height * 0.72), CGPoint(x: s.width * 0.34, y: s.height * 0.61), CGPoint(x: s.width * 0.47, y: s.height * 0.68), CGPoint(x: s.width * 0.64, y: s.height * 0.5), CGPoint(x: s.width * 0.84, y: s.height * 0.58)]
        var path = Path(); path.move(to: points[0]); points.dropFirst().forEach { path.addLine(to: $0) }
        c.stroke(path, with: .color(style.accent.opacity(0.4)), lineWidth: 2)
        for point in points { c.fill(Path(ellipseIn: CGRect(x: point.x - 3, y: point.y - 3, width: 6, height: 6)), with: .color(style.secondary.opacity(0.8))) }
    }

    private func gitBranch(_ c: inout GraphicsContext, _ s: CGSize) {
        let points = [CGPoint(x: s.width * 0.58, y: s.height * 0.24), CGPoint(x: s.width * 0.58, y: s.height * 0.62), CGPoint(x: s.width * 0.84, y: s.height * 0.42)]
        line(&c, points[0], points[1], style.accent, opacity: 0.42, width: 2)
        var curve = Path(); curve.move(to: points[0]); curve.addCurve(to: points[2], control1: CGPoint(x: s.width * 0.58, y: s.height * 0.4), control2: CGPoint(x: s.width * 0.76, y: s.height * 0.42)); c.stroke(curve, with: .color(style.secondary.opacity(0.42)), lineWidth: 2)
        for point in points { c.fill(Path(ellipseIn: CGRect(x: point.x - 6, y: point.y - 6, width: 12, height: 12)), with: .color(style.background)); c.stroke(Path(ellipseIn: CGRect(x: point.x - 6, y: point.y - 6, width: 12, height: 12)), with: .color(style.accent.opacity(0.72)), lineWidth: 2) }
    }

    private func cubes(_ c: inout GraphicsContext, _ s: CGSize, origin: CGPoint, count: Int) {
        for i in 0..<count {
            let column = i % 3
            let row = i / 3
            let rect = CGRect(x: origin.x + CGFloat(column) * 42, y: origin.y + CGFloat(row) * 39 + CGFloat(column % 2) * 8, width: 30, height: 30)
            rounded(&c, rect, radius: 3, fill: i.isMultiple(of: 2) ? style.accent : style.secondary, strokeOpacity: 0.38)
            line(&c, rect.origin, CGPoint(x: rect.maxX, y: rect.maxY), style.background, opacity: 0.18)
        }
    }

    private func timeline(_ c: inout GraphicsContext, _ s: CGSize, x: CGFloat) {
        let lineX = s.width * x
        line(&c, CGPoint(x: lineX, y: s.height * 0.22), CGPoint(x: lineX, y: s.height * 0.78), style.secondary, opacity: 0.3, width: 2)
        for i in 0..<4 {
            let y = s.height * (0.24 + Double(i) * 0.16)
            c.fill(Path(ellipseIn: CGRect(x: lineX - 5, y: y - 5, width: 10, height: 10)), with: .color(style.accent.opacity(0.8)))
            rounded(&c, CGRect(x: lineX + 12, y: y - 9, width: 54, height: 18), radius: 4, fill: style.surface, strokeOpacity: 0.18)
        }
    }

    private func flame(_ c: inout GraphicsContext, _ s: CGSize, center: CGPoint) {
        var outer = Path(); outer.move(to: CGPoint(x: center.x, y: center.y - 58)); outer.addCurve(to: CGPoint(x: center.x - 38, y: center.y + 46), control1: CGPoint(x: center.x - 10, y: center.y - 18), control2: CGPoint(x: center.x - 52, y: center.y + 4)); outer.addCurve(to: CGPoint(x: center.x + 38, y: center.y + 46), control1: CGPoint(x: center.x - 12, y: center.y + 64), control2: CGPoint(x: center.x + 24, y: center.y + 62)); outer.addCurve(to: CGPoint(x: center.x, y: center.y - 58), control1: CGPoint(x: center.x + 58, y: center.y + 4), control2: CGPoint(x: center.x + 12, y: center.y - 14)); outer.closeSubpath()
        c.fill(outer, with: .linearGradient(Gradient(colors: [style.accent, style.secondary]), startPoint: CGPoint(x: center.x, y: center.y - 58), endPoint: CGPoint(x: center.x, y: center.y + 54)))
    }

    private func crystal(_ c: inout GraphicsContext, _ s: CGSize, center: CGPoint, scale: CGFloat = 1) {
        let width = 56 * scale, height = 78 * scale
        var shape = Path(); shape.move(to: CGPoint(x: center.x, y: center.y - height / 2)); shape.addLine(to: CGPoint(x: center.x + width / 2, y: center.y - height * 0.12)); shape.addLine(to: CGPoint(x: center.x + width * 0.32, y: center.y + height / 2)); shape.addLine(to: CGPoint(x: center.x - width * 0.32, y: center.y + height / 2)); shape.addLine(to: CGPoint(x: center.x - width / 2, y: center.y - height * 0.12)); shape.closeSubpath()
        c.fill(shape, with: .linearGradient(Gradient(colors: [style.secondary.opacity(0.75), style.accent.opacity(0.28)]), startPoint: CGPoint(x: center.x, y: center.y - height / 2), endPoint: CGPoint(x: center.x, y: center.y + height / 2)))
        c.stroke(shape, with: .color(style.secondary.opacity(0.62)), lineWidth: 1.5)
    }

    private func arch(_ c: inout GraphicsContext, _ s: CGSize) {
        var arch = Path(); arch.move(to: CGPoint(x: s.width * 0.58, y: s.height * 0.78)); arch.addLine(to: CGPoint(x: s.width * 0.58, y: s.height * 0.38)); arch.addCurve(to: CGPoint(x: s.width * 0.92, y: s.height * 0.38), control1: CGPoint(x: s.width * 0.62, y: s.height * 0.08), control2: CGPoint(x: s.width * 0.88, y: s.height * 0.08)); arch.addLine(to: CGPoint(x: s.width * 0.92, y: s.height * 0.78)); c.stroke(arch, with: .color(style.accent.opacity(0.52)), lineWidth: 3)
    }

    private func wing(_ c: inout GraphicsContext, _ s: CGSize, center: CGPoint) {
        for i in 0..<5 {
            var feather = Path(); feather.move(to: center); feather.addCurve(to: CGPoint(x: center.x - 34 - CGFloat(i) * 13, y: center.y + 18 + CGFloat(i) * 7), control1: CGPoint(x: center.x - 12, y: center.y - 18 - CGFloat(i) * 4), control2: CGPoint(x: center.x - 32 - CGFloat(i) * 10, y: center.y + 2)); c.stroke(feather, with: .color(style.secondary.opacity(0.42 - Double(i) * 0.045)), lineWidth: 2)
        }
    }

    private func axes(_ c: inout GraphicsContext, _ s: CGSize, center: CGPoint) {
        line(&c, center, CGPoint(x: center.x + 72, y: center.y), .red, opacity: 0.65, width: 2)
        line(&c, center, CGPoint(x: center.x, y: center.y - 68), .green, opacity: 0.65, width: 2)
        line(&c, center, CGPoint(x: center.x - 46, y: center.y + 48), .blue, opacity: 0.65, width: 2)
    }

    private func wireCube(_ c: inout GraphicsContext, _ s: CGSize, origin: CGPoint, size: CGFloat) {
        let offset = CGPoint(x: size * 0.34, y: -size * 0.28)
        let front = CGRect(x: origin.x, y: origin.y, width: size, height: size)
        let back = CGRect(x: origin.x + offset.x, y: origin.y + offset.y, width: size, height: size)
        c.stroke(Path(front), with: .color(style.secondary.opacity(0.42)), lineWidth: 1.5)
        c.stroke(Path(back), with: .color(style.accent.opacity(0.52)), lineWidth: 1.5)
        for (a, b) in [(front.origin, back.origin), (CGPoint(x: front.maxX, y: front.minY), CGPoint(x: back.maxX, y: back.minY)), (CGPoint(x: front.minX, y: front.maxY), CGPoint(x: back.minX, y: back.maxY)), (CGPoint(x: front.maxX, y: front.maxY), CGPoint(x: back.maxX, y: back.maxY))] { line(&c, a, b, style.accent, opacity: 0.38) }
    }

    private func grid(_ c: inout GraphicsContext, _ s: CGSize) {
        for x in stride(from: 0.0, through: s.width, by: 34) {
            line(&c, CGPoint(x: x, y: s.height * 0.2), CGPoint(x: s.width * 0.58, y: s.height), style.secondary, opacity: 0.07)
        }
        for y in stride(from: s.height * 0.24, through: s.height, by: 26) {
            line(&c, CGPoint(x: 0, y: y), CGPoint(x: s.width, y: y), style.secondary, opacity: 0.06)
        }
    }

    private func prompt(_ c: inout GraphicsContext, _ s: CGSize) {
        var prompt = Path()
        prompt.move(to: CGPoint(x: s.width * 0.78, y: s.height * 0.4))
        prompt.addLine(to: CGPoint(x: s.width * 0.86, y: s.height * 0.5))
        prompt.addLine(to: CGPoint(x: s.width * 0.78, y: s.height * 0.6))
        c.stroke(prompt, with: .color(style.accent.opacity(0.62)), lineWidth: 4)
        line(&c, CGPoint(x: s.width * 0.88, y: s.height * 0.6), CGPoint(x: s.width * 0.96, y: s.height * 0.6), style.accent, opacity: 0.62, width: 4)
    }
}
