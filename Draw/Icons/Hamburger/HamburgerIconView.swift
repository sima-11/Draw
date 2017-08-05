//
//  HamburgerIconView.swift
//  Draw
//
//  Created by Ma, Si (UK - London) on 8/5/17.
//  Copyright © 2017 Si Ma. All rights reserved.
//

import UIKit

@IBDesignable open class HamburgerIconView: IconView {
    
    @IBInspectable open var numberOfLines: UInt {
        get {
            return self.iconLayer.numberOfLines
        }
        set {
            self.iconLayer.numberOfLines = newValue
        }
    }
    
    override open var iconLayer: HamburgerIconLayer {
        return self.layer as! HamburgerIconLayer
    }
    
    override open class var layerClass: AnyClass {
        return HamburgerIconLayer.self
    }
}
