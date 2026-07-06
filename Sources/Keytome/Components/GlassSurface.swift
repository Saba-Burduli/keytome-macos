import SwiftUI

struct GlassSurface: View {
    @AppStorage(AppearancePreferences.glassEnabledKey) private var glassEnabled = false
    @Environment(\.accessibilityReduceTransparency) private var reduceTransparency

    let opaque: Color
    var tint: Color = .clear

    var body: some View {
        Rectangle()
            .fill(glassEnabled && !reduceTransparency ? AnyShapeStyle(.ultraThinMaterial) : AnyShapeStyle(opaque))
            .overlay(tint.opacity(glassEnabled && !reduceTransparency ? 0.08 : 0.0))
    }
}
