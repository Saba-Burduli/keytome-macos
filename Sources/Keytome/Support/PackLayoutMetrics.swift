import CoreGraphics

enum PackLayoutMetrics {
    static let compactDetailWidth: CGFloat = 700

    static func isCompact(detailWidth: CGFloat) -> Bool {
        detailWidth < compactDetailWidth
    }
}
