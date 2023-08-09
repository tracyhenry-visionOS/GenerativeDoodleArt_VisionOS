# Generative Wall Art with Apple Vision Pro
Explore the transformative capabilities of visionOS by creating augmented reality wall art using Vision Pro. This project integrates RealityKit, Reality Composer Pro, SwiftUI, and UIKit to offer an immersive AR experience.

![Alt Text](resources/part2.gif)

Follow us on Twitter: [![Twitter](https://img.shields.io/twitter/url/https/twitter.com/tracy__henry.svg?style=social&label=Follow%20%40tvon_g)](https://twitter.com/tvon_g) [![Twitter](https://img.shields.io/twitter/url/https/twitter.com/tracy__henry.svg?style=social&label=Follow%20%40tracy__henry)](https://twitter.com/tracy__henry)
### visionOS APIs Used

- Scene Types (WindowGroup & ImmersiveSpace)
- RealityKit
    - AnchorEntity (Plane Detection & Head Tracking)
    - ModelEntity
    - BillboardSystem
    - ParticleEmitterComponent
    - SwiftUI Attachments
    - SimpleMaterial
    - TextureResource
- SwiftUI
    - RealityView
    - Observable Macro
    - Animations
- UIKit
    - UIBezierPath

### 3D Content

This demo handles 3D content in two ways. First, the main character including its animations and particle effects is created in Reality Composer Pro. Second, the image canvas and its resources are created programmatically in Swift.

### Setup

To run this project you need Xcode 15 Beta 5+ and visionOS 1.0 which you can download [here](https://developer.apple.com/download/all/?q=xcode%2015).

1. Clone the repo.
2. Open the project in Xcode 15.
3. Select the root project GenerativeWallArt in the view hierarchy.
4. Go to Signing & Capabilities.
5. Select your development team.
6. Select the Apple Vision Pro simulator as a build target.
7. Build and run the project.
8. Select the museum scene, and move the character to the empty wall.
9. Tap the character to start the demo

### Tutorials

[![IMAGE ALT TEXT HERE](resources/demo_video_thumb.png)](https://youtu.be/IefFafD8mR8)

_More Videos coming soon!_
