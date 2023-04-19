//
//  Protocols.swift
//  MateScout
//
//  Created by Kiar on 05/04/23.
//

import Foundation
import SpriteKit

protocol ShapeClicked: AnyObject
{
    func shapeClicked(shape: Raft)
}

protocol ButtonClicked: AnyObject
{
    func buttonClicked(button: Button)
}

//protocol RaftsAssociative: AnyObject
//{
//    func sumRafts(raft: Raft)
//}

var gameMode = GameManager()
