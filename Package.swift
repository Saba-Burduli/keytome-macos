// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "KeyForge",
    platforms: [.macOS(.v14)],
    products: [
        .executable(name: "KeyForge", targets: ["KeyForge"])
    ],
    targets: [
        .executableTarget(
            name: "KeyForge",
            path: "Sources/KeyForge"
        ),
        .testTarget(
            name: "KeyForgeTests",
            dependencies: ["KeyForge"],
            path: "Tests/KeyForgeTests"
        )
    ]
)
