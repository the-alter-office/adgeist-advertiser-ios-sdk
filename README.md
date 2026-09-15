# AdgeistAdvertiserSDK

iOS advertiser attribution & tracking SDK. Supports iOS/iPadOS 13+, works with both UIKit and SwiftUI.

## Installation

### Swift Package Manager

In Xcode, **File → Add Package Dependencies…** and enter:

```
https://github.com/the-alter-office/adgeist-advertiser-ios-sdk
```

Or add it to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/the-alter-office/adgeist-advertiser-ios-sdk", from: "0.0.5")
],
targets: [
    .target(
        name: "YourTarget",
        dependencies: [
            .product(name: "AdgeistAdvertiserSDK", package: "adgeist-advertiser-ios-sdk")
        ]
    )
]
```

The package ships a prebuilt XCFramework, so no source build step is needed.

> CocoaPods is no longer supported.

## Setup

### 1. Configure Info.plist

Add your Adgeist app ID (as identified in the Adgeist web interface) to your app's `Info.plist`:

```xml
<!-- Sample Adgeist app ID: 69326f9fbb280f9241cabc94 -->
<key>ADGEIST_APP_ID</key>
<string>YOUR_ADGEIST_ID</string>
```

Replace `YOUR_ADGEIST_ID` with your actual Adgeist app ID.

### 2. Request App Tracking Transparency permission

The SDK reads the device's advertising identifier (IDFA) to attribute installs and events, but it never prompts the user itself — **Apple requires the host app to request tracking authorization**.

Add a usage description to your app's `Info.plist`:

```xml
<key>NSUserTrackingUsageDescription</key>
<string>We use your advertising identifier to provide personalized ads and measure ad performance.</string>
```

Then request authorization early in your app's lifecycle (e.g. right after launch), before you expect any events to be sent:

```swift
import AppTrackingTransparency

ATTrackingManager.requestTrackingAuthorization { _ in
    // SDK will pick up the resulting status automatically.
}
```

If the user declines or the app doesn't request authorization, the SDK falls back to a locally generated identifier instead of the IDFA.

### 3. Initialize tracking

Import the SDK and use the `AdgeistAttribution.shared` singleton — no separate configure/init call is needed.

#### SwiftUI

```swift
import SwiftUI
import AdgeistAdvertiserSDK

@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear {
                    AdgeistAttribution.shared.sendVisitImpression()
                }
                .onOpenURL { url in
                    AdgeistAttribution.shared.sendVisitImpression(uri: url)
                }
        }
    }
}
```

#### UIKit

```swift
import AdgeistAdvertiserSDK

func application(_ application: UIApplication,
                  didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    AdgeistAttribution.shared.sendVisitImpression()
    return true
}

func application(_ app: UIApplication, open url: URL,
                  options: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {
    AdgeistAttribution.shared.sendVisitImpression(uri: url)
    return true
}
```

## Usage

### Track a visit / deeplink open

```swift
AdgeistAttribution.shared.sendVisitImpression()       // app opened
AdgeistAttribution.shared.sendVisitImpression(uri: url) // opened via deeplink
```

### Track engagement

Call on every route/screen change and on meaningful button taps. Each call sends an `ENGAGEMENT` event.

```swift
AdgeistAttribution.shared.sendEngagementEvent()
AdgeistAttribution.shared.sendEngagementEvent(properties: ["screen": "product_detail"])
```

#### SwiftUI

```swift
NavigationStack(path: $path) { ... }
    .onChange(of: path) { _ in
        AdgeistAttribution.shared.sendEngagementEvent()
    }

Button("Add to cart") {
    addToCart()
    AdgeistAttribution.shared.sendEngagementEvent(properties: ["action": "add_to_cart"])
}
```

#### UIKit

```swift
override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    AdgeistAttribution.shared.sendEngagementEvent(properties: ["screen": "ProductDetailVC"])
}
```

### Track session end

Call from the app lifecycle when the session ends — typically when the app goes to the background. Sends a `SESSION_END` event.

#### SwiftUI

```swift
@Environment(\.scenePhase) private var scenePhase

WindowGroup {
    ContentView()
        .onChange(of: scenePhase) { phase in
            if phase == .background {
                AdgeistAttribution.shared.sendSessionEndEvent()
            }
        }
}
```

#### UIKit

```swift
func sceneDidEnterBackground(_ scene: UIScene) {
    AdgeistAttribution.shared.sendSessionEndEvent()
}
```

### Track a custom event

```swift
AdgeistAttribution.shared.sendCustomEvent(
    eventName: "purchase",
    properties: ["amount": 49.99, "currency": "USD"]
)
```

Only `Bool`, `Int`, `Double`, and `String` property values are supported; other types are dropped. The same applies to `sendEngagementEvent` properties.

## Event timing

Every event carries `additionalData.timeElapsed` — milliseconds between this event and the previously sent one. `VISIT` always reports `0`, since it opens the session. The value is measured with a monotonic clock, so it is unaffected by device clock changes.
