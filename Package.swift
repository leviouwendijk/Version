// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Version",
    platforms: [
        .macOS(.v13)
    ],
    products: [
        .library(
            name: "Version",
            targets: ["Version"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/leviouwendijk/Arguments.git",
            branch: "master"
        ),
        .package(
            url: "https://github.com/leviouwendijk/Schema.git",
            branch: "master"
        ),
    ],
    targets: [
        .target(
            name: "Version",
            dependencies: [
                .product(
                    name: "Arguments",
                    package: "Arguments"
                ),
                .product(
                    name: "Schema",
                    package: "Schema"
                ),
            ]
        ),
    ]
)
