//
//  SearchIconLayer.swift
//  Draw
//
//  Created by Ma, Si (UK - London) on 8/3/17.
//  Copyright © 2017 Si Ma. All rights reserved.
//

import UIKit

open class SearchIconLayer: IconLayer {
    
    open override func draw(in ctx: CGContext) {
        super.draw(in: ctx)
        
        UIGraphicsPushContext(ctx)
        
        let squareTwo = CGFloat(sqrt(2.0))
        let size = self.bounds.size
        let intersection = CGPoint(x: size.width / 1.8, y: size.height / 1.8)
        let handleCoordinateOffset = min(size.width - intersection.x, size.height - intersection.y) - self.lineWidth
        let circleRadius = min(size.width, size.height) / (CGFloat(2.0) + squareTwo)
        let circleCentre = CGPoint(x: intersection.x - circleRadius/squareTwo, y: intersection.y - circleRadius/squareTwo)
        
        // Add circle
        ctx.addEllipse(in: CGRect(x: circleCentre.x - circleRadius, y: circleCentre.y - circleRadius, width: circleRadius * 2, height: circleRadius * 2))
        
        // Add line
        ctx.move(to: intersection)
        ctx.addLine(to: CGPoint(x: handleCoordinateOffset, y: handleCoordinateOffset) + intersection)
        
        ctx.strokePath()
        
        UIGraphicsPopContext()
    }
}
