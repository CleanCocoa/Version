// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "Version",
    products: [
        .library(
            name: "Version",
            targets: ["Version"]),
        .library(
            name: "Version-Dynamic",
            type: .dynamic,
            targets: ["Version"]),
    ],
    targets: [
        .target(
            name: "Version",
            dependencies: []),
        .testTarget(
            name: "VersionTests",
            dependencies: ["Version"]),
    ]
)
