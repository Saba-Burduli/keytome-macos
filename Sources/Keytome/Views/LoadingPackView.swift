import SwiftUI

struct LoadingPackView: View {
    let style: PackVisualStyle

    var body: some View {
        VStack(spacing: 8) {
            ForEach(0..<5, id: \.self) { index in
                HStack(spacing: 14) {
                    RoundedRectangle(cornerRadius: 8)
                        .fill(style.accent.opacity(0.15))
                        .frame(width: 38, height: 38)
                    VStack(alignment: .leading, spacing: 7) {
                        RoundedRectangle(cornerRadius: 3).fill(Color.white.opacity(0.15)).frame(width: 150, height: 10)
                        RoundedRectangle(cornerRadius: 3).fill(Color.white.opacity(0.08)).frame(width: 230, height: 8)
                    }
                    Spacer()
                    RoundedRectangle(cornerRadius: 7)
                        .fill(style.accent.opacity(0.1))
                        .frame(width: 110 + CGFloat(index % 2) * 25, height: 32)
                }
                .padding(.horizontal, 16)
                .frame(height: 66)
                .background(style.surface.opacity(0.7), in: RoundedRectangle(cornerRadius: 10))
            }
        }
        .padding(12)
        .redacted(reason: .placeholder)
        .accessibilityElement(children: .ignore)
        .accessibilityLabel("Loading shortcuts")
    }
}
