// Swift Package Manager manifest for InnerTubeKit
// Pure Swift YouTube Music catalog search and audio stream extractor

import PackageDescription

let package = Package(
    name: "InnerTubeKit",
    platforms: [
        .iOS(.v16),
        .macOS(.v13)
    ],
    products: [
        .library(
            name: "InnerTubeKit",
            targets: ["InnerTubeKit"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "InnerTubeKit",
            dependencies: []
        ),
        .testTarget(
            name: "InnerTubeKitTests",
            dependencies: ["InnerTubeKit"]
        ),
    ]
)