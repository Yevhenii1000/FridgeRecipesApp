//
//  IngredientResultTableViewCell.swift
//  FridgeRecipesApp
//
//  Created by Yevhenii on 23.01.2018.
//  Copyright © 2018 Yevhenii. All rights reserved.
//

import UIKit

class IngredientResultTableViewCell: UITableViewCell {
    
    @IBOutlet weak var checkbox: VKCheckbox!
    @IBOutlet weak var ingredientNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        ingredientNameLabel.textColor = AppKeyColors.theTitleColor
        
        self.backgroundColor = UIColor.clear
        
        didTapCheckbox()
        customizeCheckbox()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //MARK: - Checkbox Initialization
    
    func didTapCheckbox() {
        
        checkbox.checkboxValueChangedBlock = { isOn in
            
            let message = isOn ? "ON" : "OFF"
            print(message)
            
            UIView.animate(withDuration: 0.088,
                           delay: 0,
                           options: [ .curveEaseInOut],
                           animations: {
                            
                            let transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
                            
                            self.checkbox.transform = transform
            },
                           completion: { (completed) in
                            
                            UIView.animate(withDuration: 0.088, animations: {
                                
                                self.checkbox.transform = CGAffineTransform.identity
                                
                            })
                            
            })
            
        }
        
    }
    
    func customizeCheckbox() {
        
        checkbox.bgColor = UIColor.clear
        checkbox.bgColorSelected = AppKeyColors.iconsColor.withAlphaComponent(0.3)
        checkbox.borderColor = AppKeyColors.navigationTextColor
        checkbox.color = AppKeyColors.navigationTextColor
        checkbox.borderWidth = 2.5
        checkbox.cornerRadius = checkbox.frame.height / 2
    }
    
}
