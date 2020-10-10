// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "MeasureKit",
    
    platforms: [
        .macOS(.v10_15), .iOS(.v14)//, .tvOS(.v10), .watchOS(.v4)
    ],
    products: [
        .library(
            name: "MeasureKit",
            targets: ["MeasureKit"]),
    ],
    dependencies: [
            // .package(url: "../LocalBase", .exact("1.0.0")),
        .package(url: "https://github.com/bretsko/LocalBase", .exact("1.0.0")),

        //TODO: try use
        //https://github.com/Flight-School/Rate

      // .package(url: "../Quick/Quick", .exact("1.0.0")),
      //   .package(url: "../Quick/Nimble", .exact("1.0.0")),
         .package(url: "https://github.com/bretsko/Quick", from: "2.2.1"),
         .package(url: "https://github.com/bretsko/Nimble", from: "8.0.1"),
    ],
    targets: [
        .target(
            name: "MeasureKit",
            dependencies: ["LocalBase"]),
        
        .testTarget(
            name: "MeasureKitTests",
            dependencies: ["MeasureKit",
                           "Quick", "Nimble"]),
    ]
)
