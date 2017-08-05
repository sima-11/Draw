//
//  GridIconView.swift
//  Draw
//
//  Created by Ma, Si (UK - London) on 8/5/17.
//  Copyright © 2017 Si Ma. All rights reserved.
//

import UIKit

@IBDesignable open class GridIconView: IconView {
    
    @IBInspectable open var numberOfRows: UInt {
        get {
            return self.iconLayer.numberOfRows
        }
        set {
            self.iconLayer.numberOfRows = newValue
        }
    }
    @IBInspectable open var numberOfColumns: UInt {
        get {
            return self.iconLayer.numberOfColumns
        }
        set {
            self.iconLayer.numberOfColumns = newValue
        }
    }
    
    open var shape: Shape {
        get {
            return self.iconLayer.shape
        }
        set {
            self.iconLayer.shape = newValue
        }
    }
    open var shapeSize: CGFloat {
        get {
            return self.iconLayer.shapeSize
        }
        set {
            self.iconLayer.shapeSize = newValue
        }
    }
    
    override open var iconLayer: GridIconLayer {
        return self.layer as! GridIconLayer
    }
    
    override open class var layerClass: AnyClass {
        return GridIconLayer.self
    }
}
