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
            url: "https://github.com/the-alter-office/adgeist-advertiser-ios-sdk/releases/download/0.0.10-beta.3/AdgeistAdvertiserSDK.xcframework.zip",
            checksum: "49670a8f9b0033b113a21d7363171045c26ef24a99b8ec52e9019a19ee8a0e1e"
        )
    ]
)
