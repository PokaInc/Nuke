// swift-tools-version:6.0
import PackageDescription

let swiftSettings: [SwiftSetting] = [
    .enableExperimentalFeature("StrictConcurrency"),
    .enableUpcomingFeature("GlobalActorInferenceCutoff"),
    .enableUpcomingFeature("MemberImportVisibility"),
    .enableUpcomingFeature("AccessLevelOnImport"),
    .enableUpcomingFeature("NonescapableTypes"),
    .enableUpcomingFeature("GlobalActorIsolatedTypesUsability"),
    .enableUpcomingFeature("DynamicActorIsolation"),
    .enableUpcomingFeature("InferSendableFromCaptures"),
    .enableUpcomingFeature("RegionBasedIsolation"),
    .enableUpcomingFeature("GlobalConcurrency"),
    .enableUpcomingFeature("IsolatedDefaultValues"),
    .enableUpcomingFeature("DisableOutwardActorInference"),
    .enableUpcomingFeature("ImportObjcForwardDeclarations"),
    .enableUpcomingFeature("DeprecateApplicationMain"),
    .enableUpcomingFeature("BareSlashRegexLiterals"),
    .enableUpcomingFeature("ImplicitOpenExistentials"),
    .enableUpcomingFeature("ForwardTrailingClosures"),
    .enableUpcomingFeature("ConciseMagicFile"),
    .enableUpcomingFeature("ExistentialAny")
]

let package = Package(
    name: "Nuke",
    platforms: [
        .iOS(.v16),
        .tvOS(.v16),
        .macOS(.v13),
        .watchOS(.v9),
        .visionOS(.v1)
    ],
    products: [
        .library(name: "Nuke", targets: ["Nuke"]),
        .library(name: "NukeUI", targets: ["NukeUI"]),
        .library(name: "NukeVideo", targets: ["NukeVideo"]),
        .library(name: "NukeExtensions", targets: ["NukeExtensions"])
    ],
    targets: [
        .target(name: "Nuke", swiftSettings: swiftSettings),
        .target(name: "NukeUI", dependencies: ["Nuke", "NukeExtensions"], swiftSettings: swiftSettings),
        .target(name: "NukeVideo", dependencies: ["Nuke", "NukeExtensions"], swiftSettings: swiftSettings),
        .target(name: "NukeExtensions", dependencies: ["Nuke"], swiftSettings: swiftSettings)
    ],
    swiftLanguageModes: [.v5]
)
