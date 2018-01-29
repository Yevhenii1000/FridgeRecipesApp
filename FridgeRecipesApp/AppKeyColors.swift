//
//  KeyColorsStructure.swift
//  FridgeRecipesApp
//
//  Created by Yevhenii on 29.11.2017.
//  Copyright © 2017 Yevhenii. All rights reserved.
//

import Foundation
import UIKit

struct AppKeyColors {
    
    static var backgroundGradientColors: (CGColor, CGColor) {
        
        let topColor = UIColor(red: 254/255.0, green: 250/255.0, blue: 241/255.0, alpha: 1.0).cgColor
        let bottomColor = UIColor(red: 255/255.0, green: 230/255.0, blue: 190/255.0, alpha: 1.0).cgColor
            
        return (topColor, bottomColor)
        
    }
    
    static var navigationTextColor: UIColor {
        
        return UIColor(red: 229/255.0, green: 137/255.0, blue: 148/255.0, alpha: 1.0)
        
    }
    
    static var titleTextColor: UIColor {
    
        return UIColor(red: 254/255.0, green: 183/255.0, blue: 126/255.0, alpha: 1.0)
        
        
    }
    
    static let theTitleColor = UIColor(red: 254/255.0, green: 183/255.0, blue: 126/255.0, alpha: 1.0)
    
    static var descriptionTextColor: UIColor {
        
        return UIColor(red: 140/255.0, green: 140/255.0, blue: 140/255.0, alpha: 1.0)
        
    }
    
    static var iconsColor: UIColor {
        
        return self.titleTextColor
        
    }
    
    static var buttonsColor: UIColor {
        
        return self.titleTextColor
        
    }
    
}

