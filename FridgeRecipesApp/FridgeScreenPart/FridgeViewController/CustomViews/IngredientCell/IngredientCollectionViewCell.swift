//
//  IngredientCollectionViewCell.swift
//  FridgeRecipesApp
//
//  Created by Yevhenii on 29.11.2017.
//  Copyright © 2017 Yevhenii. All rights reserved.
//

import UIKit

protocol ItemEditingDelegate {
    func deleteItem(at row: Int)
}

class IngredientCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var ingredientImage: UIImageView!
    @IBOutlet weak var backgroundCellView: UIView!
    
    @IBOutlet weak var deleteIngredientButton: UIButton!
    
    var itemEditingDelegate: ItemEditingDelegate? = nil
    
    //Item`s row at the IngredientCollectionViewCell
    var itemRow: Int = 0
    
    var cellIsEditing: Bool = false {
        didSet{
            
            switch cellIsEditing {
            case true:
                UIView.animate(withDuration: 0.1,
                               delay: 0,
                               options: [.curveEaseIn],
                               animations: {
                                self.deleteIngredientButton.isHidden = false
                                self.deleteIngredientButton.layer.opacity = 1.0
                                },
                               completion: nil)
            default:
                UIView.animate(withDuration: 0.1,
                               delay: 0,
                               options: [.curveEaseIn],
                               animations: {
                                self.deleteIngredientButton.layer.opacity = 0.0
                                
                },
                               completion: { completion in
                                self.deleteIngredientButton.isHidden = true
                
                })
            }
            
            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        nameLabel.adjustsFontSizeToFitWidth = true
        descriptionLabel.adjustsFontSizeToFitWidth = true
        backgroundCellView.layer.cornerRadius = 15
        ingredientImage.layer.cornerRadius = 5
        
        deleteIngredientButton.layer.cornerRadius = deleteIngredientButton.bounds.width / 2
        deleteIngredientButton.clipsToBounds = true
        
        cellIsEditing = false
    }
    
    func setKeyColorsToUIElements() {
        
        nameLabel.textColor = AppKeyColors.titleTextColor
        descriptionLabel.textColor = AppKeyColors.descriptionTextColor
        
    }
    
    //MARK: - Action
    
    @IBAction func deleteButtonDidTap(_ sender: UIButton) {
        
        if itemEditingDelegate != nil {
            
            itemEditingDelegate?.deleteItem(at: itemRow)
            
        }
        
    }
    

}
