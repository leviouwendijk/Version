// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "VersionTests",
    platforms: [
        .macOS(.v13)
    ],
    products: [
        .executable(name: "t_version", targets: ["VersionTests"]),
    ],
    dependencies: [

        .package(url: "https://github.com/leviouwendijk/Testing.git", branch: "master"),
        .package(path: ".."),
    ],
    targets: [
        .executableTarget(
            name: "VersionTests",
            dependencies: [.product(name: "Version", package: "Version"), .product(name: "Testing", package: "Testing")]
        ),
    ]
)
