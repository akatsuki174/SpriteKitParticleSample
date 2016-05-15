//
//  SmokeParticleScene.swift
//  SpriteKitParticleSample
//
//  Created by akatsuki174 on 2016/05/15.
//  Copyright © 2016年 akatsuki174. All rights reserved.
//

import SpriteKit

class SmokeParticleScene: SKScene {

    override func didMoveToView(view: SKView) {
        self.backgroundColor = UIColor.clearColor()
        
    }
    
    func show(type: String) {
        if (self.children.count == 0) {
            guard let path = NSBundle.mainBundle().pathForResource("\(type)Particle", ofType: "sks") else {
                return
            }
            let particle = NSKeyedUnarchiver.unarchiveObjectWithFile(path) as! SKEmitterNode
            particle.position = CGPointMake(CGRectGetMidX(self.frame), 15.0)
            self.addChild(particle)
        }
    }
}
