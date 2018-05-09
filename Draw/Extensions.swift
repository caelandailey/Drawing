//
//  Extensions.swift
//  Draw
//
//  Created by Caelan Dailey on 5/8/18.
//  Copyright © 2018 Caelan Dailey. All rights reserved.
//

import Foundation
import UIKit

// Setting the color of an image
extension UIImageView {
    func setImageColor(color: UIColor) {
        // Render
        let temp = self.image?.withRenderingMode(UIImageRenderingMode.alwaysTemplate)
        // Set image
        self.image = temp
        // Set color
        self.tintColor = color
    }
}

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        
        // Make sure values correct
        assert(red >= 0 && red <= 255, "Invalid red")
        assert(green >= 0 && green <= 255, "Invalid green")
        assert(blue >= 0 && blue <= 255, "Invalid blue")
        
        // Init with values
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    // Gets values from int
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
    
    // Sets to int
    func toHexInt() -> Int {
        var r:CGFloat = 0
        var g:CGFloat = 0
        var b:CGFloat = 0
        var a:CGFloat = 0
        
        getRed(&r, green: &g, blue: &b, alpha: &a)
        
        return (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0
    }
}
