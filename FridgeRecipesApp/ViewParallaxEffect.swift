//
//  ViewParallaxEffect.swift
//  FridgeRecipesApp
//
//  Created by Yevhenii on 18.12.2017.
//  Copyright © 2017 Yevhenii. All rights reserved.
//

import Foundation
import UIKit

struct ViewParallaxEffect {
    static func applyMotionEffect(toView view: UIView, withMagnitude magnitude: Float) {
        
        let xMotion = UIInterpolatingMotionEffect(keyPath: "center.x", type: .tiltAlongHorizontalAxis)
        xMotion.minimumRelativeValue = -magnitude
        xMotion.maximumRelativeValue = magnitude
        
        let yMotion = UIInterpolatingMotionEffect(keyPath: "center.y", type: .tiltAlongVerticalAxis)
        yMotion.minimumRelativeValue = -magnitude
        yMotion.maximumRelativeValue = magnitude
        
        let motionGroup = UIMotionEffectGroup()
        
        motionGroup.motionEffects = [xMotion, yMotion]
        
        view.addMotionEffect(motionGroup)
        
    }
    
}

