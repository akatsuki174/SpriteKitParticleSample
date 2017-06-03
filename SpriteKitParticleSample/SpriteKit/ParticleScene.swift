//
//  SmokeParticleScene.swift
//  SpriteKitParticleSample
//
//  Created by akatsuki174 on 2016/05/15.
//  Copyright © 2016年 akatsuki174. All rights reserved.
//

import SpriteKit

class ParticleScene: SKScene {

    override func didMove(to view: SKView) {
        self.backgroundColor = UIColor.clear
    }
    
    func show(_ type: String) {
        if (self.children.count == 0) {
            guard let path = Bundle.main.path(forResource: "\(type)Particle", ofType: "sks") else {
                return
            }
            let particle = NSKeyedUnarchiver.unarchiveObject(withFile: path) as! SKEmitterNode
            particle.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
            self.addChild(particle)
        }
    }
}
