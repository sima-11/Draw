//
//  IconView.swift
//  Draw
//
//  Created by Ma, Si (UK - London) on 8/5/17.
//  Copyright © 2017 Si Ma. All rights reserved.
//

import UIKit

@IBDesignable open class IconView: UIView {
    
    @IBInspectable open var colour: UIColor {
        get {
            return self.iconLayer.colour
        }
        set {
            self.iconLayer.colour = newValue
        }
    }
    @IBInspectable open var lineWidth: CGFloat {
        get {
            return self.iconLayer.lineWidth
        }
        set {
            self.iconLayer.lineWidth = newValue
        }
    }
    
    open var iconLayer: IconLayer {
        return self.layer as! IconLayer
    }
    
    override open class var layerClass: AnyClass {
        return IconLayer.self
    }
}
