# Wall Art with Apple Vision Pro
Explore the transformative capabilities of visionOS by creating augmented reality wall art using Vision Pro. This project integrates RealityKit, Reality Composer Pro, SwiftUI, and UIKit to offer an immersive AR experience.

![Alt Text](resources/part2.gif)

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

To run this project you need XCode 15 and visionOS 1.0 which you can download here.

1. Clone the repo.
2. Open the project in XCode 15.
3. Select the root project GenerativeWallArt in the view hierarchy.
4. Go to Signing & Capabilities.
5. Select your development team.
6. Select the Apple Vision Pro simulator as a build target.
7. Build and run the   

### Tutorials

[![IMAGE ALT TEXT HERE](resources/demo_video_thumb.png)](https://youtu.be/IefFafD8mR8)

_More Videos coming soon!_
