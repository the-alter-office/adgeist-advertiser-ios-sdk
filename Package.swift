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
            url: "https://github.com/the-alter-office/adgeist-advertiser-ios-sdk/releases/download/0.0.10-beta.1/AdgeistAdvertiserSDK.xcframework.zip",
            checksum: "25c435042cff4754367c71ad7a72c0b8b8e3c35f2e3403a3a5b93d9a646c70c6"
        )
    ]
)
