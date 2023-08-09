
import Foundation
import RealityKit

struct ImpactParticleSystem: System {
    static let query = EntityQuery(where: .has(ParticleEmitterComponent.self))
    static var bursted = false
    static var canBurst = false

    init(scene: Scene) {}

    func update(context: SceneUpdateContext) {
        if !Self.bursted && Self.canBurst {
            for p in context.entities(matching: Self.query, when: .rendering) {
                if p.name == "ImpactParticle" {
                    print("Burst!!!")
                    p.components[ParticleEmitterComponent.self]?.burst()
                }
            }
            Self.bursted = true
        }
    }
}
