// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FirebaseManager",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "FirebaseManager",
            targets: ["FirebaseManager"]),
    ],
    dependencies: [
        .package(url: "https://github.com/firebase/firebase-ios-sdk", from: "10.12.0")
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "FirebaseManager",
            dependencies: [
                .product(name: "FirebaseMessaging", package: "firebase-ios-sdk"),
                .target(name: "PushNotificationManager"),
                .target(name: "PushNotificationFirebaseManager")
            ]),
        .testTarget(
            name: "FirebaseManagerTests",
            dependencies: ["FirebaseManager"]),
        .binaryTarget(
            name: "PushNotificationManager",
            path: "PushNotificationManager.xcframework"),
        .binaryTarget(
            name: "PushNotificationFirebaseManager",
            path: "PushNotificationFirebaseManager.xcframework"),
    ]
)
