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
            url: "https://github.com/the-alter-office/adgeist-advertiser-ios-sdk/releases/download/0.0.9/AdgeistAdvertiserSDK.xcframework.zip",
            checksum: "daf042cec2781ee6e7453bc1a8d94625ffb5b83ed9d36bb57f2b97fe0b74a7f0"
        )
    ]
)
