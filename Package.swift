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
            url: "https://github.com/the-alter-office/adgeist-advertiser-ios-sdk/releases/download/0.0.10-beta.4/AdgeistAdvertiserSDK.xcframework.zip",
            checksum: "0e44e9cf5123f403a097787817f875a7a464640af65e464c35205e09787786e0"
        )
    ]
)
