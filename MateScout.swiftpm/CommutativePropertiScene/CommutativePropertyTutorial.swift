//
//  CommutativePropertyTutorial.swift
//  MateScout
//
//  Created by Kiar on 18/04/23.
//

import Foundation
import SpriteKit
import SwiftUI

class CommutativePropertyTutorial: SKScene
{
    override func didMove(to view: SKView) {

        backgroundColor = UIColor.white
        
        var tutorialImage = SKSpriteNode(imageNamed: "tutorialCommutative")
        addChild(tutorialImage)
        tutorialImage.position = CGPoint(x: frame.midX, y: frame.midY)
        tutorialImage.size = CGSize(width: 850, height: 1000)
        
        var backImage = SKSpriteNode(imageNamed: "Back")
        backImage.name = "back"
        backImage.position = CGPoint(x: frame.minX + 100, y: frame.midY + 500)
        backImage.size = CGSize(width: 100, height: 100)
        addChild(backImage)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let backScene = CommutativeProperty(size: view!.bounds.size)
        
        let touch = touches.first!
        let location = touch.location(in: self)
        
        if atPoint(location).name == "back"
        {
            view?.presentScene(backScene)
        }
    }
}
