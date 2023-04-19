//
//  AssociativePropertyTutorial.swift
//  MateScout
//
//  Created by Kiar on 19/04/23.
//

import Foundation
import SpriteKit
import SwiftUI

class AssociativePropertyTutorial: SKScene
{
    override func didMove(to view: SKView) {
        gameMode.associative = true
        gameMode.commutative = false
        
        backgroundColor = UIColor.white
        
        var tutorialImage = SKSpriteNode(imageNamed: "tutorialAssociative")
        addChild(tutorialImage)
        tutorialImage.position = CGPoint(x: frame.midX, y: frame.midY)
        tutorialImage.size = CGSize(width: 1000, height: 959)
        
        var backImage = SKSpriteNode(imageNamed: "Back")
        backImage.name = "back"
        backImage.position = CGPoint(x: frame.minX + 100, y: frame.midY + 500)
        backImage.size = CGSize(width: 100, height: 100)
        addChild(backImage)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let backScene = LevelSelector(size: view!.bounds.size)
        
        let touch = touches.first!
        let location = touch.location(in: self)
        
        if atPoint(location).name == "back"
        {
            view?.presentScene(backScene)
        }
    }
}
