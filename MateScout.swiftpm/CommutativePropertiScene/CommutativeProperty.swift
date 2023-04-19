//
//  CommutativeProperty.swift
//  MateScout
//
//  Created by Kiar on 05/04/23.
//

import Foundation
import SpriteKit
import SwiftUI

//Properties
class CommutativeProperty: SKScene, ShapeClicked, ButtonClicked
{
    var tutorialScene: SKScene {
            let tutorialScene = CommutativePropertyTutorial()
            tutorialScene.size = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            tutorialScene.scaleMode = .fill
            return tutorialScene
         }
    
    
    var levelComplete: Bool = false
    
    let rafts = [Raft(texture: SKTexture(imageNamed: "Raft"), color: .brown, size: CGSize(width: 200, height: 100)),
                 Raft(texture: SKTexture(imageNamed: "Raft"), color: .brown, size: CGSize(width: 200, height: 200)),
                 Raft(texture: SKTexture(imageNamed: "Raft"), color: .brown, size: CGSize(width: 250, height: 300)),
                 Raft(texture: SKTexture(imageNamed: "Raft"), color: .brown, size: CGSize(width: 200, height: 400))
    ]
    
    let ground = SKSpriteNode(imageNamed: "Ground")
    
    var sea = Sea(texture: SKTexture(imageNamed: "Sea"), color: .blue, size: CGSize(width: 10000, height: 300))
    
    var button = Button(texture: SKTexture(imageNamed: "QuestionMark"), color: .black, size: CGSize(width: 100, height: 100))
    
    var winText = SKLabelNode(fontNamed: "SF Pro")
    
}

//SceneFunction
extension CommutativeProperty
{
    override func didMove(to view: SKView) {
        gameMode.commutative = true
        gameMode.associative = false
        
        setupRafts()
        setupQuestionMark()
        
        addChild(sea)
        sea.position = CGPoint(x: 300, y: 580)
        
        addChild(button)
        button.position = CGPoint(x: 750, y: 900)
        button.colorBlendFactor = 1
        button.color = UIColor.white
        
        addChild(ground)
        ground.position = CGPoint(x: 400, y: 300)
        ground.size = CGSize(width: 1000, height: 2000)
        ground.zPosition = 0
        
        let firstText = SKLabelNode(fontNamed: "SF Pro")
        firstText.text = "Hello new MateScout! Here we have to build a bridge."
        firstText.fontSize = 30
        firstText.fontColor = SKColor.white
        firstText.position = CGPoint(x: 380, y: 1070)
        firstText.zPosition = 10
           
        addChild(firstText)
        
        let secondText = SKLabelNode(fontNamed: "SF Pro")
        secondText.text = "As you can see there are pieces of wood of various sizes."
        secondText.fontSize = 30
        secondText.fontColor = SKColor.white
        secondText.position = CGPoint(x: 400, y: 1030)
        secondText.zPosition = 10
           
        addChild(secondText)
        
        let thirdText = SKLabelNode(fontNamed: "SF Pro")
        thirdText.text = "Click them to place it on the sea."
        thirdText.fontSize = 25
        thirdText.fontColor = SKColor.white
        thirdText.position = CGPoint(x: 380, y: 920)
        thirdText.zPosition = 10
           
        addChild(thirdText)
        
        winText.text = "Congrats, you have learn the commutative property of the sum!"
        winText.fontSize = 30
        winText.fontColor = SKColor.green
        winText.position = CGPoint(x: frame.midX, y: frame.midY)
        winText.zPosition = 10
        winText.isHidden = true
        addChild(winText)
    }
}

//Setup function
extension CommutativeProperty
{
    func setupRafts()
    {
        for index in 0..<rafts.count
        {
            rafts[index].delegate = self
            addChild(rafts[index])
        }
        
        rafts[0].position = CGPoint(x: 70, y: 300)
        
        rafts[1].setUpRaftLength(raftLength: 2)
        rafts[1].position = CGPoint(x: 200, y: 300)
        
        rafts[2].setUpRaftLength(raftLength: 3)
        rafts[2].position = CGPoint(x: 350, y: 300)
        
        rafts[3].setUpRaftLength(raftLength: 4)
        rafts[3].position = CGPoint(x: 500, y: 300)
    }
    
    func setupQuestionMark()
    {
        button.delegate = self
    }
}

//Special Function
extension CommutativeProperty
{
    func shapeClicked(shape: Raft) {
        print("raft Clicked")
            shape.isHidden = true
            sea.buildBridge(raftLength: shape.raftLength)
            if(sea.checkIsComplete() == true)
            {
                print("win game")
                gameMode.trophies[0] = true
                winText.isHidden = false
                let transition = SKTransition.fade(with: .black, duration: 6)
                                    let menuScene = LevelSelector()
                menuScene.size = CGSize(width: 600, height: 1200)
                                    self.view!.presentScene(menuScene, transition: transition)
        }
    }
    
    func buttonClicked(button: Button) {
        print("? clicked")
        view?.presentScene(tutorialScene)
    }
}
