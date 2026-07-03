// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "Keytome",
    platforms: [.macOS(.v14)],
    products: [
        .executable(name: "Keytome", targets: ["Keytome"])
    ],
    targets: [
        .executableTarget(
            name: "Keytome",
            path: "Sources/Keytome"
        ),
        .testTarget(
            name: "KeytomeTests",
            dependencies: ["Keytome"],
            path: "Tests/KeytomeTests"
        )
    ]
)
