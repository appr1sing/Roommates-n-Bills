//
//  Gradient.swift
//  Roommates-N-Bills
//
//  Created by Arvin San Miguel on 5/27/18.
//  Copyright © 2018 Appr1sing Studios. All rights reserved.
//

import Foundation
import UIKit

struct Gradient {
    
    var gl: CAGradientLayer!
    
    init(top: UIColor, btm: UIColor) {
        let colorTop = top.cgColor
        let colorBottom = btm.cgColor
        self.gl = CAGradientLayer()
        self.gl.colors = [colorTop, colorBottom]
        self.gl.locations = [0.0, 1.0]
    }
    
}

struct Colors {
    
    static let BLUSH : (top: UIColor, btm: UIColor) = (UIColor(red:0.70, green:0.27, blue:0.57, alpha:1.0),
                                                       UIColor(red:0.95, green:0.37, blue:0.47, alpha:1.0))
    static let SCOOTER : (top: UIColor, btm: UIColor) = (UIColor(red:0.21, green:0.82, blue:0.86, alpha:1.0),
                                                         UIColor(red:0.36, green:0.53, blue:0.90, alpha:1.0))
    
}

struct Fonts {
    static let GTWALSHEIM_MED = UIFont(name: "GTWalsheimMedium", size: 20)
    static let GTWALSHEIM_MED_OBL = UIFont(name: "GTWalsheimMedium-Oblique", size: 25)
    static let GTWALSHEIM_LIGHT_12 = UIFont(name: "GTWalsheimLight-Oblique", size: 14)
}
