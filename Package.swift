// swift-tools-version:5.9

import PackageDescription

let package = Package(
    name: "AdgeistAdvertiserSDK",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "AdgeistAdvertiserSDK",
            targets: ["AdgeistAdvertiserSDK"]
        )
    ],
    targets: [
        .binaryTarget(
            name: "AdgeistAdvertiserSDK",
            url: "https://github.com/the-alter-office/adgeist-advertiser-ios-sdk/releases/download/0.0.10-beta.2/AdgeistAdvertiserSDK.xcframework.zip",
            checksum: "4c41a67ffebd68b4327b60580a3ec7daa62918ee4acba92fa88efdfd56cb3b4c"
        )
    ]
)
