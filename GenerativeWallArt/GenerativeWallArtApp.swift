
import RealityKit
import RealityKitContent
import SwiftUI

@main
struct GenerativeWallArtApp: App {
    @State private var viewModel = ViewModel()

    init() {
        RealityKitContent.BillboardComponent.registerComponent()
        RealityKitContent.BillboardSystem.registerSystem()
        ImpactParticleSystem.registerSystem()
        ProjectileComponent.registerComponent()
    }

    var body: some SwiftUI.Scene {
        WindowGroup {
            ContentView()
                .environment(viewModel)
        }.windowStyle(.plain)
        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
                .environment(viewModel)
        }
        WindowGroup(id: "doodle_canvas") {
            DoodleView()
                .environment(viewModel)
        }
    }
}
