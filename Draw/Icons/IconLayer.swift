//
//  IconLayer.swift
//  Draw
//
//  Created by Ma, Si (UK - London) on 8/5/17.
//  Copyright © 2017 Si Ma. All rights reserved.
//

import UIKit

open class IconLayer: CALayer {
    
    open var colour = UIColor.gray {
        didSet{
            self.setNeedsDisplay()
        }
    }
    open var lineWidth: CGFloat = 0.0 {
        didSet {
            self.setNeedsDisplay()
        }
    }
    open var lineCap: CGLineCap = .round {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    open override func draw(in ctx: CGContext) {
        ctx.setLineWidth(self.lineWidth)
        ctx.setLineCap(self.lineCap)
        ctx.setStrokeColor(self.colour.cgColor)
        ctx.setFillColor(self.colour.cgColor)
    }
}
