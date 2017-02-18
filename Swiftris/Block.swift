//
//  Block.swift
//  Swiftris
//
//  Created by としや on 2017/02/17.
//  Copyright © 2017年 Toshiya Takeshita. All rights reserved.
//

//import Foundation
import SpriteKit

let NumberOfColors: UInt32 = 6

enum BlockColor: Int, CustomStringConvertible {
    case Blue = 0, Orange, Purple, Red, Teal, Yellow
    
    var spriteName: String {
        switch self {
        case .Blue:
            return "blue.png"
        case .Orange:
            return "orange.png"
        case .Purple:
            return "purple.png"
        case .Red:
            return "red.png"
        case .Teal:
            return "teal.png"
        case .Yellow:
            return "yellow.png"
        }
    }
    
    var description: String {
        return self.spriteName
    }
    
    static func random() -> BlockColor {
        return BlockColor(rawValue: Int(arc4random_uniform(NumberOfColors)))!
    }
}

class Block: Hashable, CustomStringConvertible {
    
    // Contants
    let color: BlockColor
    
    // Properties
    var column: Int
    var row: Int
    var sprite: SKSpriteNode?
    
    var spriteName: String {
        return color.spriteName
    }
    
    var hashValue: Int {
        return self.column ^ self.row
    }
    
    var description: String {
        return "\(color): [\(column), \(row)]"
    }
    
    init(column:Int, row:Int, color:BlockColor) {
        self.column = column
        self.row = row
        self.color = color
    }
    
    static func ==(lhs: Block, rhs: Block) -> Bool {
        return lhs.column == rhs.column && lhs.row == rhs.row && lhs.color.rawValue == rhs.color.rawValue
    }
    
}
