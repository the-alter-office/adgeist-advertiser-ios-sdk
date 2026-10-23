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
            url: "https://github.com/the-alter-office/adgeist-advertiser-ios-sdk/releases/download/0.0.10/AdgeistAdvertiserSDK.xcframework.zip",
            checksum: "c2db92a4769d1ff737d92214d2125aa0821a7cc3e7f3cf80a6785fd33e175017"
        )
    ]
)
