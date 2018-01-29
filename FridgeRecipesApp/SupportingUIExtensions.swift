//
//  GradientExtensionUIView.swift
//  FridgeRecipesApp
//
//  Created by Yevhenii on 15.12.2017.
//  Copyright © 2017 Yevhenii. All rights reserved.
//

import Foundation
import UIKit

enum GradientPoints {
    
    case leftRight
    case rightLeft
    case topBottom
    case bottomTop
    case topLeftBottomRight
    case bottomRightTopLeft
    case topRightBottomLeft
    case bottomLeftTopRight
    
}

extension UIView {
    
    func insertGradient(gradientLayer: CAGradientLayer, topColor: CGColor, bottomColor: CGColor) {
        
        gradientLayer.frame = self.bounds
        
        gradientLayer.colors = [topColor, bottomColor]
        gradientLayer.locations = [0.0, 1.0]
    
        gradientLayer.frame = self.bounds
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
    
}

extension UINavigationBar {
    
    func gradientBackgroundOnNavigationBarFrom(topColor: CGColor, bottomColor: CGColor) {
        
        let gradientLayer = CAGradientLayer()
        
        let statusBarFrame = UIApplication.shared.statusBarFrame
        
        let lightSiennaColor = UIColor(red: 0.996078431606293, green: 0.941176474094391, blue: 0.737254917621613, alpha: 0.6).cgColor
        
        let darkSiennaColor = UIColor(red: 250/255.0, green: 214/255.0, blue: 179/255.0, alpha: 1.0).cgColor
        
        let gradientLayerFrame = CGRect(x: self.frame.origin.x, y: self.frame.origin.y, width: self.frame.width, height: self.frame.height + statusBarFrame.height)
        
        gradientLayer.frame = gradientLayerFrame
        gradientLayer.colors = [lightSiennaColor, darkSiennaColor]
        //gradientLayer.locations = [0.8, 1.0]
        gradientLayer.startPoint = CGPoint(x: 1.0, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 0.0, y: 0.0)
        
        self.setBackgroundImage(imageFromLayer(layer: gradientLayer), for: UIBarMetrics.default)
        
    }
    
    func imageFromLayer(layer: CALayer) -> UIImage {
        
        UIGraphicsBeginImageContext(layer.frame.size)
        
        layer.render(in: UIGraphicsGetCurrentContext()!)
        let outputImage = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        return outputImage!
    }
    
}
