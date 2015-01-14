//
//  StarNode.swift
//  PhysicsCup
//
//  Created by John Fisher on 12/5/14.
//  Copyright (c) 2014 John Fisher. All rights reserved.
//

import UIKit
import SpriteKit

class StarNode: SKSpriteNode, SKPhysicsContactDelegate {
    class func star(location: CGPoint) -> StarNode {
        let sprite = StarNode(imageNamed:"star.png")
        
        sprite.xScale = 0.075
        sprite.yScale = 0.075
        sprite.position = location
        
        sprite.physicsBody = SKPhysicsBody(texture: SKTexture(imageNamed: "star.png"), size: sprite.size)
        if let physics = sprite.physicsBody {
            physics.affectedByGravity = true
            physics.allowsRotation = true
            physics.dynamic = true;
            physics.linearDamping = 0.75
            physics.angularDamping = 0.75
            sprite.name = "star"
        }
        return sprite
    }
}
