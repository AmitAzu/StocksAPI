// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "StocksAPI",
    platforms: [
        .macOS(.v12), .iOS(.v13), .tvOS(.v13), .macCatalyst(.v13), .watchOS(.v8)
    ],
    products: [
        .library(
            name: "StocksAPI",
            targets: ["StocksAPI"]),
        .executable(name: "StocksAPIExecutable",
                    targets: ["StocksAPIExecutable"])
    ],
    targets: [
        .target(
            name: "StocksAPI",
            dependencies: []),
        .executableTarget(name: "StocksAPIExecutable",
                          dependencies: ["StocksAPI"]),
        .testTarget(
            name: "StocksAPITests",
            dependencies: ["StocksAPI"]),
    ]
)
