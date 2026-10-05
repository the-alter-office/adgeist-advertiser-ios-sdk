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
            url: "https://github.com/the-alter-office/adgeist-advertiser-ios-sdk/releases/download/0.0.9-beta.1/AdgeistAdvertiserSDK.xcframework.zip",
            checksum: "75d781b7b45673854a9b4da253be3195a7b9e8250aeaaa694bb1271e2ab56f19"
        )
    ]
)
