//
//  LevelSelector.swift
//  MateScout
//
//  Created by Kiar on 18/04/23.
//

import Foundation
import SpriteKit

class LevelSelector: SKScene
{
    var firstButton = SKSpriteNode(imageNamed: "ADDITION")
    var secondButton = SKSpriteNode(imageNamed: "SUB")
    
    var trophy1: SKSpriteNode!
    var trophy2: SKSpriteNode!
    
    override func didMove(to view: SKView) {
        gameMode.associative = false
        gameMode.commutative = false
        
        backgroundColor = UIColor.white
        
        let titleText = SKLabelNode(fontNamed: "SF Pro")
        titleText.text = "Properties of addition"
        titleText.fontSize = 50
        titleText.fontColor = SKColor.black
        titleText.position = CGPoint(x: frame.minX + 250, y: frame.midY + 300)
        titleText.zPosition = 10
           
        addChild(titleText)
        
        firstButton.name = "sum"
        secondButton.name = "sub"
        addChild(firstButton)
        addChild(secondButton)
        
        firstButton.size = CGSize(width: 300, height: 100)
        firstButton.position = CGPoint(x: 300, y: frame.midY + 100)
        firstButton.zPosition = 100
        
        secondButton.size = CGSize(width: 300, height: 100)
        secondButton.position = CGPoint(x: 300, y: frame.midY - 100)
        secondButton.zPosition = 100
        
       trophy1 = SKSpriteNode(imageNamed: "trophy")
        
        addChild(trophy1)
        trophy1.position = CGPoint(x: firstButton.position.x + 200, y: firstButton.position.y)
        trophy1.size = CGSize(width: 50, height: 50)
        trophy1.isHidden = true
        trophy2 = SKSpriteNode(imageNamed: "trophy")
        addChild(trophy2)
        trophy2.position = CGPoint(x: secondButton.position.x + 200, y: secondButton.position.y)
        trophy2.size = CGSize(width: 50, height: 50)
        trophy2.isHidden = true
        showTrophies()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let firstScene = CommutativeProperty(size: view!.bounds.size)
        let secondScene = AssociativePropertyTutorial(size: view!.bounds.size)
        
        let touch = touches.first!
        let location = touch.location(in: self)
        
        if atPoint(location).name == "sum"
        {
            view?.presentScene(firstScene)
        }
        if atPoint(location).name == "sub"
        {
            view?.presentScene(secondScene)
        }
    }
}


//setup fun
extension LevelSelector
{
    func showTrophies()
    {
        if(gameMode.trophies[0] == true)
        {
            trophy1.isHidden = false
        }
        if(gameMode.trophies[1] == true)
        {
            trophy2.isHidden = false
        }
    }
}
