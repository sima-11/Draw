//
//  GridIconLayer.swift
//  Draw
//
//  Created by Ma, Si (UK - London) on 8/5/17.
//  Copyright © 2017 Si Ma. All rights reserved.
//

import UIKit

public enum Shape {
    case square
    case circle
}

open class GridIconLayer: IconLayer {
    
    open var shape: Shape = .square {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    open var numberOfColumns: UInt = 3 {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    open var numberOfRows: UInt = 3 {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    open var shapeSize: CGFloat = 10.0 {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    open func drawShape(rect: CGRect, context: CGContext) {
        if self.shape == .square {
            context.addRect(rect)
        }
        else if self.shape == .circle {
            context.addEllipse(in: rect)
        }
    }
    
    open override func draw(in ctx: CGContext) {
        super.draw(in: ctx)
        
        UIGraphicsPushContext(ctx)
        
        let centre = CGPoint(x: self.bounds.size.width/2, y: self.bounds.size.height/2)
        let halfShapeSize = self.shapeSize / 2
        
        ctx.setLineWidth(self.lineWidth)
        
        if self.numberOfRows == 1 && self.numberOfColumns == 1 {
            if self.shape == .square {
                ctx.addRect(CGRect(x: centre.x - halfShapeSize, y: centre.y - halfShapeSize, width: self.shapeSize, height: self.shapeSize))
            }
            else if self.shape == .circle {
                ctx.addArc(center: centre, radius: halfShapeSize, startAngle: 0.0, endAngle: CGFloat.pi*2, clockwise: true)
            }
        }
        else {
            var offsetX = halfShapeSize
            var offsetY = halfShapeSize
            
            if self.numberOfRows == 1 {
                
                let verticalDistance = (self.bounds.size.width - self.shapeSize) / CGFloat(self.numberOfColumns - 1)
                for _ in 0..<self.numberOfColumns {
                    let rect = CGRect(x: offsetX - halfShapeSize, y: centre.y - halfShapeSize, width: self.shapeSize, height: self.shapeSize)
                    self.drawShape(rect: rect, context: ctx)
                    offsetX += verticalDistance
                }
            }
            else if self.numberOfColumns == 1 {
                
                let horizontalDistance = (self.bounds.size.height - self.shapeSize) / CGFloat(self.numberOfRows - 1)
                for _ in 0..<self.numberOfRows {
                    let rect = CGRect(x: centre.x - halfShapeSize, y: offsetY - halfShapeSize, width: self.shapeSize, height: self.shapeSize)
                    self.drawShape(rect: rect, context: ctx)
                    offsetY += horizontalDistance
                }
            }
            else {
                
                let verticalDistance = (self.bounds.size.width - self.shapeSize) / CGFloat(self.numberOfColumns - 1)
                let horizontalDistance = (self.bounds.size.height - self.shapeSize) / CGFloat(self.numberOfRows - 1)
                for _ in 0..<self.numberOfRows {
                    offsetX = halfShapeSize
                    for _ in 0..<self.numberOfColumns {
                        let rect = CGRect(x: offsetX - halfShapeSize, y: offsetY - halfShapeSize, width: self.shapeSize, height: self.shapeSize)
                        self.drawShape(rect: rect, context: ctx)
                        offsetX += verticalDistance
                    }
                    offsetY += horizontalDistance
                }
            }
        }
        
        ctx.fillPath()
        
        UIGraphicsPopContext()
    }
}
