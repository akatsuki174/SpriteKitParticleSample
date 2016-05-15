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
        self.view.backgroundColor = UIColor.blackColor()
        self.setupParticle()
    }
    
    func setupParticle() {
        guard let t = text else {
            return
        }
        self.skView.userInteractionEnabled = false
        self.skView.allowsTransparency = true
        let scene = SmokeParticleScene.unarchiveFromFile("\(t)ParticleScene") as! SmokeParticleScene
        self.skView.presentScene(scene)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        let scene = self.skView.scene as! SmokeParticleScene
        if let t = text {
            scene.show(t)
        }
    }
}

extension SKNode {
    class func unarchiveFromFile(file : NSString) -> SKNode? {
        if let path = NSBundle.mainBundle().pathForResource(file as String, ofType: "sks") {
            let sceneData = try! NSData(contentsOfFile: path, options: .DataReadingMappedIfSafe)
            let archiver = NSKeyedUnarchiver(forReadingWithData: sceneData)
            archiver.setClass(self.classForKeyedUnarchiver(), forClassName: "SKScene")
            let myScene = archiver.decodeObjectForKey(NSKeyedArchiveRootObjectKey) as! SmokeParticleScene
            archiver.finishDecoding()
            return myScene
        } else {
            return nil
        }
    }
}
