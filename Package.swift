// swift-tools-version:4.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "azureSwiftRuntime",
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "azureSwiftRuntime",
            targets: ["azureSwiftRuntime"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(url: "https://github.com/Alamofire/Alamofire.git", from: "4.0.10"),
        .package(url: "https://github.com/ReactiveX/RxSwift.git", from: "3.4.2"),
        .package(url: "https://github.com/SwiftyJSON/SwiftyJSON.git", from: "3.1.4"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "azureSwiftRuntime",
            dependencies: ["Alamofire", "RxSwift", "SwiftyJSON"]),
        .testTarget(
            name: "azureSwiftRuntimeTests",
            dependencies: ["Alamofire", "RxSwift", "SwiftyJSON","azureSwiftRuntime"]),
    ]
)
