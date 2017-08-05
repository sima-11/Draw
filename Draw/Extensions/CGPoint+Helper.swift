//
//  CGPoint+Helper.swift
//
//  Created by Ma, Si (UK - London) on 7/19/17.
//  Copyright © 2017 Si Ma. All rights reserved.
//

import SpriteKit

extension CGPoint {
    
    static func + (left: CGPoint, right: CGPoint) -> CGPoint {
        return CGPoint(x: left.x + right.x, y: left.y + right.y)
    }
    
    static func - (left: CGPoint, right: CGPoint) -> CGPoint {
        return CGPoint(x: left.x - right.x, y: left.y - right.y)
    }
    
    static func * (left: CGPoint, factor: CGFloat) -> CGPoint {
        return CGPoint(x: left.x * factor, y: left.y * factor)
    }
    
    static func / (left: CGPoint, factor: CGFloat) -> CGPoint {
        return CGPoint(x: left.x / factor, y: left.y / factor)
    }
    
    static func += (left: inout CGPoint, right: CGPoint) {
        left = left + right
    }
    
    static func -= (left: inout CGPoint, right: CGPoint) {
        left = left - right
    }
    
    static func *= (left: inout CGPoint, factor: CGFloat) {
        left = left * factor
    }
    
    static func /= (left: inout CGPoint, factor: CGFloat) {
        left = left / factor
    }
    
    static prefix func -(p: CGPoint) -> CGPoint {
        return p * -1
    }
}
