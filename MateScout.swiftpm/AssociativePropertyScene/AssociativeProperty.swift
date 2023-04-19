//
//  AssociativeProperty.swift
//  MateScout
//
//  Created by Kiar on 18/04/23.
//

import Foundation
import SpriteKit
import SwiftUI


class AssociativeProperty: SKScene, ButtonClicked, ShapeClicked
{
    var firstSize: Int = 0
    var secondSize: Int = 0
    var firstTouch: Bool = false
    var raftsComplete: Bool = false
    
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
}

//SceneFunction
extension AssociativeProperty
{
    override func didMove(to view: SKView) {
        gameMode.associative = true
        gameMode.commutative = false
        print(gameMode.associative)
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
    }
}

//Setup function
extension AssociativeProperty
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
extension AssociativeProperty
{
    func shapeClicked(shape: Raft) {
        print("raft Clicked")
        shape.isHidden = true
        sea.buildBridge(raftLength: shape.raftLength)
    }
    
    func buttonClicked(button: Button) {
        print("? clicked")
        view?.presentScene(CommutativePropertyTutorial())
    }
    
}
