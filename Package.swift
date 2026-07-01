// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Version",
    products: [
        .library(
            name: "Version",
            targets: ["Version"]
        ),
    ],
    targets: [
        .target(
            name: "Version"
        ),
    ]
)
