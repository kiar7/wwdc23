//
//  Sea.swift
//  MateScout
//
//  Created by Kiar on 06/04/23.
//

import Foundation
import SpriteKit

class Sea: SKSpriteNode
{
    var currentPos = 0
    
    var rafts = [Raft(texture: SKTexture(imageNamed: "Raft"), color: .brown, size: CGSize(width: 100, height: 60)),
    Raft(texture: SKTexture(imageNamed: "Raft"), color: .brown, size: CGSize(width: 100, height: 60)),
    Raft(texture: SKTexture(imageNamed: "Raft"), color: .brown, size: CGSize(width: 100, height: 60)),
    Raft(texture: SKTexture(imageNamed: "Raft"), color: .brown, size: CGSize(width: 100, height: 60)),
    Raft(texture: SKTexture(imageNamed: "Raft"), color: .brown, size: CGSize(width: 100, height: 60)),
    Raft(texture: SKTexture(imageNamed: "Raft"), color: .brown, size: CGSize(width: 100, height: 60)),
    Raft(texture: SKTexture(imageNamed: "Raft"), color: .brown, size: CGSize(width: 100, height: 60)),
     Raft(texture: SKTexture(imageNamed: "Raft"), color: .brown, size: CGSize(width: 100, height: 100)),
     Raft(texture: SKTexture(imageNamed: "Raft"), color: .brown, size: CGSize(width: 100, height: 100)),
     Raft(texture: SKTexture(imageNamed: "Raft"), color: .brown, size: CGSize(width: 100, height: 100))]
    
    var gridPositions = [CGPoint()]
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        
        super.init(texture: texture, color: color, size: size)
        self.zPosition = 1
        addRaftInScene()
        setupGridPoint()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//setup functions
extension Sea
{
    
    func addRaftInScene()
    {
        for index in 0..<rafts.count
        {
            addChild(rafts[index])
        }
    }
    
    func setupGridPoint()
    {
        gridPositions = [CGPoint(x: 0, y: -135),
                         CGPoint(x: 0, y: -105),
                         CGPoint(x: 0, y: -75),
                         CGPoint(x: 0, y: -45),
                         CGPoint(x: 0, y: -15),
                         CGPoint(x: 0, y: 15),
                         CGPoint(x: 0, y: 45),
                         CGPoint(x: 0, y: 75),
                         CGPoint(x: 0, y: 105),
                         CGPoint(x: 0, y: 135)
                        ]
        setUpArrayPath()
    }
    
    func setUpArrayPath()
    {
        for index in 0..<rafts.count
        {
            rafts[index].position = gridPositions[index]
            rafts[index].isHidden = true
        }
    }
    
    func buildBridge(raftLength: Int)
    {
        for _ in 0..<raftLength
        {
            rafts[currentPos].isHidden = false
            currentPos += 1
        }
    }
    
    func checkIsComplete() -> Bool
    {
        if(currentPos >= rafts.count)
        {
            return true
        }
        else
        {
            return false
        }
    }
}
