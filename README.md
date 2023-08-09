Vision Pro app to create wall art and display it in your physical envrioment. The main purpose of this app is to learn and showcase what visionOS is capable of.

[![Watch the video](https://img.youtube.com/vi/IefFafD8mR8/default.jpg)](https://youtu.be/IefFafD8mR8)

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

This demo handles 3D content in two ways. First, the main character including its animations and particle effects are created in Reality Composer Pro. Second, the image canvas and its resources are created programmatically in Swift.

### Setup

To run this project you need XCode 15 and visionOS 1.0 which you can download here.

1. Clone the repo.
2. Open the project in XCode 15.
3. Select the root project GenerativeWallArt in the view hiarchy.
4. Go to Signing & Capabilities.
5. Select your development team.
6. Select the Apple Vision Pro simulator as a build target.
7. Build and run the   

### Tutorials

_Coming soon!_
