//
//  CameraViewController.swift
//  Colory
//
//  Created by belal medhat on 01/02/2023.
//

import UIKit
import RealityKit
import ARKit
class CameraViewController: UIViewController {

    @IBOutlet weak var wallArView: ARView!
    var colorSelected:UIColor?
    override func viewDidLoad() {
        super.viewDidLoad()
        let anchor = AnchorEntity(plane: .vertical,classification: [.ceiling, .wall],minimumBounds: [0.5, 0.5])
        // Do any additional setup after loading the view.
        wallArView.scene.addAnchor(anchor)
        let wallScene = try! Wall.loadWallScene()
        anchor.addChild(wallScene)
        wallScene.generateCollisionShapes(recursive: true)
        if let box = wallScene.cube as? Entity & HasCollision {
            wallArView.installGestures([.all], for: box )
        }
//        wallScene.cube?.scale = anchor.position
        let modelEntity = wallScene.cube?.children[0] as! ModelEntity
        let material = SimpleMaterial(color: colorSelected ?? UIColor(hexString: "000000"), isMetallic: false)
        modelEntity.model?.materials = [material]
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        wallArView.session.pause()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}

