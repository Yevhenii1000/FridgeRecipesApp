//
//  IngredientCollectionDS.swift
//  FridgeRecipesApp
//
//  Created by Yevhenii on 28.11.2017.
//  Copyright © 2017 Yevhenii. All rights reserved.
//

import Foundation
import UIKit

extension FridgeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = UICollectionViewCell()
        return cell
    }
    
    
    
    
    
    
    
    
    
}

