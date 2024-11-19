// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "KeepAwake",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "KeepAwake",
            targets: ["KeepAwakePlugin"])
    ],
    dependencies: [
        .package(url: "https://github.com/ionic-team/capacitor-swift-pm.git", branch: "main")
    ],
    targets: [
        .target(
            name: "KeepAwakePlugin",
            dependencies: [
                .product(name: "Capacitor", package: "capacitor-swift-pm"),
                .product(name: "Cordova", package: "capacitor-swift-pm")
            ],
            path: "ios/Sources/KeepAwakePlugin"),
        .testTarget(
            name: "KeepAwakePluginTests",
            dependencies: ["KeepAwakePlugin"],
            path: "ios/Tests/KeepAwakePluginTests")
    ]
)
