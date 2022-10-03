// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Version",
    products: [
        .library(
            name: "Version",
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
