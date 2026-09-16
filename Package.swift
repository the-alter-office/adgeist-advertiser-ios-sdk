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
            url: "https://github.com/the-alter-office/adgeist-advertiser-ios-sdk/releases/download/0.0.8/AdgeistAdvertiserSDK.xcframework.zip",
            checksum: "cc44e663d252d95e01ffad5714d0c65dd86b7624b160afac1aa48eb65a2376c2"
        )
    ]
)
