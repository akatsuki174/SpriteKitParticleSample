//
//  ContentsViewController.swift
//  SpriteKitParticleSample
//
//  Created by akatsuki174 on 2016/05/08.
//  Copyright © 2016年 akatsuki174. All rights reserved.
//

import UIKit
import SpriteKit

class ContentsViewController: UIViewController {
    var text: String?
    
    @IBOutlet weak var skView: SKView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.gray
        self.setupParticle()
    }
    
    func setupParticle() {
        //skView.allowsTransparency = true // 今回は不要。普通はtrueにする。
        //skView.userInteractionEnabled = false // 今回は不要。必要であればfalseにする。
        let scene = ParticleScene.unarchiveFromFile("ParticleScene") as! ParticleScene
        skView.presentScene(scene)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let scene = self.skView.scene as! ParticleScene
        if let t = text {
            scene.show(t)
        }
    }
}

extension SKNode {
    class func unarchiveFromFile(_ file : NSString) -> SKNode? {
        if let path = Bundle.main.path(forResource: file as String, ofType: "sks") {
            let sceneData = try! Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            let archiver = NSKeyedUnarchiver(forReadingWith: sceneData)
            archiver.setClass(self.classForKeyedUnarchiver(), forClassName: "SKScene")
            let myScene = archiver.decodeObject(forKey: NSKeyedArchiveRootObjectKey) as! ParticleScene
            archiver.finishDecoding()
            return myScene
        } else {
            return nil
        }
    }
}
