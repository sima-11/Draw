//
//  SearchIconView.swift
//  Draw
//
//  Created by Ma, Si (UK - London) on 8/5/17.
//  Copyright © 2017 Si Ma. All rights reserved.
//

import UIKit

@IBDesignable open class SearchIconView: IconView {
    
    override open var iconLayer: SearchIconLayer {
        return self.layer as! SearchIconLayer
    }
    
    override open class var layerClass: AnyClass {
        return SearchIconLayer.self
    }
}
