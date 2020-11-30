// Created by nick_cruz on 11/30/20.
// Copyright © 2020 Airbnb Inc. All rights reserved.

let package = Package(
    // name, platforms, products, etc.
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser", from: "0.3.0"),
        // other dependencies
    ],
    products: [
        .executable(name: "advent", targets: ["Advent"])
    ],
    targets: [
        .target(name: "Advent", dependencies: [
            .product(name: "ArgumentParser", package: "swift-argument-parser"),
        ]),
        // other targets
    ]
)
