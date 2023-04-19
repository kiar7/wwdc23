//
//  Models.swift
//  MateScout
//
//  Created by Kiar on 05/04/23.
//

import Foundation
import SpriteKit

class GameManager
{
    var trophies = [false, false]
    var commutative: Bool = false
    var associative: Bool = false
    
    var buildedRafts = [Raft(texture: SKTexture(imageNamed: "Raft"), color: .brown, size: CGSize(width: 200, height: 400)),
                       Raft(texture: SKTexture(imageNamed: "Raft"), color: .brown, size: CGSize(width: 200, height: 400))
    ]
}

class Raft: SKSpriteNode
{
    var raftLength: Int
    
    weak var delegate: ShapeClicked!
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize)
    {
        raftLength = 1
        
        super.init(texture: texture, color: color, size: size)
        setUpRaftLength(raftLength: self.raftLength)
        self.zPosition = 3
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var isUserInteractionEnabled: Bool
    {
        set
        {
            //Ignore
        }
        get
        {
            return true
        }
    }
    
    func setUpRaftLength(raftLength: Int)
    {
        self.raftLength = raftLength
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.delegate?.shapeClicked(shape: self)
    }
}

class Button: SKSpriteNode
{
    
    weak var delegate: ButtonClicked!
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize)
    {
        super.init(texture: texture, color: color, size: size)
        self.zPosition = 100
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var isUserInteractionEnabled: Bool
    {
        set
        {
            //Ignore
        }
        get
        {
            return true
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.delegate?.buttonClicked(button: self)
    }
}
