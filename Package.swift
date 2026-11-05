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
            url: "https://github.com/the-alter-office/adgeist-advertiser-ios-sdk/releases/download/0.0.12-beta.2/AdgeistAdvertiserSDK.xcframework.zip",
            checksum: "9a26e191af83fd52070259eb063bff6f8e3e1ace2d09221dbe9c26e6e09b73a6"
        )
    ]
)
