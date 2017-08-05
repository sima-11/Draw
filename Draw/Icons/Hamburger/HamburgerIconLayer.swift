//
//  HamburgerIconLayer.swift
//  Draw
//
//  Created by Ma, Si (UK - London) on 8/5/17.
//  Copyright © 2017 Si Ma. All rights reserved.
//

import UIKit

open class HamburgerIconLayer: IconLayer {
    
    open var numberOfLines: UInt = 3 {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    open override func draw(in ctx: CGContext) {
        super.draw(in: ctx)
        
        UIGraphicsPushContext(ctx)
        
        let halfLineWidth = self.lineWidth / 2
        let centreY = self.bounds.size.height / 2
        
        if self.numberOfLines == 1 {
            ctx.move(to: CGPoint(x: halfLineWidth, y: centreY))
            ctx.addLine(to: CGPoint(x: self.bounds.size.width - halfLineWidth, y: centreY))
        }
        else {
            let verticalDistance = (self.bounds.size.height - self.lineWidth) / CGFloat(self.numberOfLines - 1)
            var offsetY = halfLineWidth
            for _ in 0..<self.numberOfLines {
                ctx.move(to: CGPoint(x: halfLineWidth, y: offsetY))
                ctx.addLine(to: CGPoint(x: self.bounds.size.width - halfLineWidth, y: offsetY))
                offsetY += verticalDistance
            }
        }
        
        //ctx.closePath()
        ctx.strokePath()
        
        UIGraphicsPopContext()
    }
}
