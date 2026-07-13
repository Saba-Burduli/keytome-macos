import SwiftUI

struct PackHeroArtwork: View {
    let style: PackVisualStyle
    let symbol: String

    var body: some View {
        Canvas { context, size in
            glow(&context, size)
            switch style.composition {
            case .desktop: desktop(&context, size)
            case .browser: browser(&context, size, fiery: false)
            case .browserGlow: browser(&context, size, fiery: true)
            case .shield: shield(&context, size)
            case .terminal: terminal(&context, size)
            case .tavern: tavern(&context, size)
            case .shell: shell(&context, size)
            case .ide: ide(&context, size, split: false)
            case .ideSplit, .workspace: ide(&context, size, split: true)
            case .assistant, .wideAssistant: assistant(&context, size)
            case .graph: graph(&context, size)
            case .mythic: mythic(&context, size)
            case .operatorPanel: operatorPanel(&context, size)
            case .creative: creative(&context, size)
            case .game: game(&context, size)
            case .blueprint: blueprint(&context, size)
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
