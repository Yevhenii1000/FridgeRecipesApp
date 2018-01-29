//
//  FooterReusableView.swift
//  FridgeRecipesApp
//
//  Created by Yevhenii on 14.12.2017.
//  Copyright © 2017 Yevhenii. All rights reserved.
//

import UIKit

class FooterReusableView: UICollectionReusableView {
    
    @IBOutlet weak var separatorView: UIView!

    override func draw(_ rect: CGRect) {
        separatorView.layer.cornerRadius = 5
        applyGradientToView()
        
    }
    
    override func willTransition(from oldLayout: UICollectionViewLayout, to newLayout: UICollectionViewLayout) {
        print("Layout change")
    }
    
    func applyGradientToView() {
        
        let topColor = UIColor(red: 220/255.0, green: 223/255.0, blue: 229/255.0, alpha: 1.0).cgColor
        
        let bottomColor = UIColor(red: 252/255.0, green: 253/255.0, blue: 255/255.0, alpha: 1.0).cgColor
        
        separatorView.insertGradientLayerWith(topColor: topColor, bottomColor: bottomColor)
    }
    
    override func didTransition(from oldLayout: UICollectionViewLayout, to newLayout: UICollectionViewLayout) {
        separatorView.setNeedsDisplay()
    }
    
}
