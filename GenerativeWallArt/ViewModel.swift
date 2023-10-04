
import ARKit
import Foundation
import Observation
import RealityKit
import SwiftUI

enum FlowState {
    case idle
    case intro
    case projectileFlying
    case updateWallArt
}

@Observable
@MainActor
class ViewModel {
    var flowState = FlowState.idle
    var planeAnchorsMap: [UUID: PlaneAnchor] = [:]
    var planeAnchorsEntityMap: [UUID: Entity] = [:]
    var planeAnchorEntity = Entity()
    var allPlaneAnchorEntity = Entity()

    let meshColors = [SimpleMaterial.Color.blue, SimpleMaterial.Color.green, SimpleMaterial.Color.orange]

    // ARKit stuff
    var arKitSession = ARKitSession()
    var planeDetectionProvider = PlaneDetectionProvider(alignments: [.vertical])
    var planeAnchor: PlaneAnchor?

    func initializePlaneEntity() {
        planeAnchorEntity.transform.translation = [0, 2, -5]
        planeAnchorEntity.transform.rotation = simd_quatf(angle: 90 * Float.pi / 180, axis: [1, 0, 0])
        let planeMesh = MeshResource.generatePlane(width: ImmersiveView.planeX, depth: ImmersiveView.planeZ, cornerRadius: 0.1)
        let planeEntity = ModelEntity(mesh: planeMesh, materials: [ImmersiveView.loadImageMaterial(imageUrl: "think_different")])
        planeEntity.name = "canvas"
//        planeAnchorEntity.addChild(planeEntity)
    }

    func startARKitSession() async {
        do {
            if PlaneDetectionProvider.isSupported {
                print("ARKitSession starting.")
                try await arKitSession.run([planeDetectionProvider])
            } else {
                print("Plane Detection not supported!!")
            }
        } catch {
            print("ARKit session error:", error)
        }
    }

    func subscribeToPlaneDetectionUpdates() async {
        print("waiting for plane updates")
        for await update in planeDetectionProvider.anchorUpdates {
            let curAnchor = update.anchor

            // check add and update events
            switch update.event {
            case .added:
                if curAnchor.classification == .wall, curAnchor.geometry.extent.width > 1 {
                    if planeAnchor == nil {
                        planeAnchor = curAnchor
                    }
                    planeAnchorsMap[curAnchor.id] = curAnchor

                    var curAnchorEntity = Entity()
                    curAnchorEntity.transform = Transform(matrix: curAnchor.originFromAnchorTransform)
                    var curPlaneEntity = ModelEntity(mesh: .generatePlane(width: curAnchor.geometry.extent.width, depth: curAnchor.geometry.extent.height), materials: [SimpleMaterial(color: meshColors.randomElement()!, roughness: 0.8, isMetallic: true)])
                    curPlaneEntity.name = "plane"

                    curAnchorEntity.addChild(ModelEntity(mesh: .generateText(curAnchor.classification.description), materials: [SimpleMaterial(color: .white, isMetallic: true)]))
//                    curAnchorEntity.addChild(curTextEntity)
                    curAnchorEntity.addChild(curPlaneEntity)
                    allPlaneAnchorEntity.addChild(curAnchorEntity)
                    planeAnchorsEntityMap[curAnchor.id] = curAnchorEntity
                    print("Wall Anchor Added!! ID: ", curAnchor.id)
                }
            case .updated:
                if planeAnchor?.id == curAnchor.id {
                    planeAnchor = curAnchor
                }
                if curAnchor.classification == .wall, curAnchor.geometry.extent.width > 1 {
                    let curAnchorEntity = planeAnchorsEntityMap[curAnchor.id]
                    print(curAnchorEntity)
                    let curPlaneEntity = curAnchorEntity?.findEntity(named: "plane") as! ModelEntity
                    curPlaneEntity.model?.mesh = .generatePlane(width: curAnchor.geometry.extent.width, depth: curAnchor.geometry.extent.height)
                }

            default:
                break
            }

            // update anchor entity transform
            if let planeAnchor, planeAnchor.id == curAnchor.id {
                planeAnchorEntity.transform = Transform(matrix: planeAnchor.originFromAnchorTransform)
                print("Cur plane Anchor Entity ID: ", planeAnchor.id)
                print("Cur plane Anchor Entity Transform: ", planeAnchorEntity.transform)
            }
        }
    }

    func changeWall() {
        let kvs = planeAnchorsMap.map { ($0.key, $0.value) }
        print("total anchors: ", kvs.count)
        for i in 0 ..< kvs.count {
            if kvs[i].0 == planeAnchor?.id {
                print("found existing anchor")
                planeAnchor = kvs[(i + 1) % kvs.count].1
                planeAnchorEntity.transform = Transform(matrix: planeAnchor!.originFromAnchorTransform)
                print("Cur plane Anchor Entity ID: ", planeAnchor?.id)
                print("Cur plane Anchor Entity Transform: ", planeAnchorEntity.transform)
                break
            }
        }
    }
}
