//
//  GameScene.swift
//  PhysicsCup
//
//  Created by John Fisher on 12/5/14.
//  Copyright (c) 2014 John Fisher. All rights reserved.
//

import SpriteKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    var sounds = [SKAction.playSoundFileNamed("small-bell-ring-01a.wav", waitForCompletion:true)]
    var lastTime = NSTimeInterval()
    var canPlaySound = false, shouldPlaySound = false
    
    override func didMoveToView(view: SKView) {
        self.physicsWorld.contactDelegate = self
        self.physicsWorld.gravity = CGVectorMake(0.0, -4.9)
        
        let sprite = SKSpriteNode(imageNamed: "arrow.png")
        sprite.xScale = 0.15
        sprite.yScale = 0.15
        sprite.name = "arrow"
        sprite.position = CGPointMake(self.frame.size.width/8.0, self.frame.size.height/8.0)
        self.addChild(sprite)

        sprite.runAction(SKAction.rotateByAngle(CGFloat(M_PI_2), duration: 0))
    }
    
    override func touchesEnded(touches: NSSet, withEvent event: UIEvent) {
        for touch: AnyObject in touches {
            let sprite = StarNode.star(touch.locationInNode(self))
            self.addChild(sprite)
        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        self.canPlaySound = currentTime - self.lastTime > 0.1
        if (self.canPlaySound && self.shouldPlaySound) {
            self.runAction(sounds[0])
            self.lastTime = currentTime
            self.shouldPlaySound = false
        }
    }
    
    func didBeginContact(contact: SKPhysicsContact!) {
        self.shouldPlaySound = (contact.bodyA.node?.name == "star" && contact.bodyB.node?.name == "star")
    }
}
