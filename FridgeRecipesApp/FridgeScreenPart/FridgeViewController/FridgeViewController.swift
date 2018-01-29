//
//  FridgeViewController.swift
//  FridgeRecipesApp
//
//  Created by Yevhenii on 23.11.2017.
//  Copyright © 2017 Yevhenii. All rights reserved.
//

import UIKit

class FridgeViewController: UIViewController {
    
    //Data management
    var fridgeViewModel = FridgeViewModel()
    
    //VC Supporting Properties
    let backgroundGradientlayer = CAGradientLayer()
    var collectionViewIsEditing = false
    
    //IBOutlets
    @IBOutlet weak var ingredientsCollectionView: UICollectionView!
    @IBOutlet weak var editBarButtonItem: UIBarButtonItem!
    @IBOutlet weak var gradientViewOfPlusButton: UIVisualEffectView!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var vkSwitchView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ingredientsCollectionView.delegate = self
        
        ingredientsCollectionView.backgroundColor = UIColor.clear
        registerCollectionViewCell()
        plusButtonSetUp()
        navigationBarSetUp()
        
        ingredientsCollectionView.allowsSelection = true
        ingredientsCollectionView.allowsMultipleSelection = true
                
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - View Controller Setting Up
    
    func plusButtonSetUp() {
                
        plusButton.setTitleColor(AppKeyColors.buttonsColor, for: .normal)
        
        let (top, bottom) = AppKeyColors.backgroundGradientColors
        view.insertGradient(gradientLayer: backgroundGradientlayer, topColor: top, bottomColor: bottom)
        
        ViewParallaxEffect.applyMotionEffect(toView: gradientViewOfPlusButton, withMagnitude: 20.0)
        
        print("Minor change")
        
    }
    
    func navigationBarSetUp() {
        
        editBarButtonItem.tintColor = AppKeyColors.navigationTextColor
        self.navigationController?.navigationBar.gradientBackgroundOnNavigationBarFrom(topColor: AppKeyColors.backgroundGradientColors.0, bottomColor: AppKeyColors.backgroundGradientColors.1)
        
        let barFont = UIFont(name: "Helvetica Neue", size: 23.0)
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.font: barFont!, NSAttributedStringKey.foregroundColor: AppKeyColors.navigationTextColor]
        
    }
    
    //MARK: - Collection View Setting
    func registerCollectionViewCell(){
        
        let cellNib = UINib(nibName: "IngredientCollectionViewCell", bundle: nil)
        
        ingredientsCollectionView.register(cellNib, forCellWithReuseIdentifier: "IngredientCell")
        
    }
    
    //MARK: - CollectionView Editing

    //By calling this method collectionview comes into editing mode for deleting items
    func editingModeToCollecionView() {
        
        for cell in ingredientsCollectionView.visibleCells {
            
            if let ingredientCell = cell as? IngredientCollectionViewCell {
                
                let currentEditingState = ingredientCell.cellIsEditing
                
                ingredientCell.cellIsEditing = !currentEditingState
                
            }
            
        }
        
    }
    
    //MARK:- Item Tap handlers
    
    func handleIngredientItemTap() {
        
        print("Open Ingredient Brief Info Popover Controller ")
        
    }
    
    func handleUpgradeItemTap() {
        
        print("Open In-App Market Screen")
        
    }
    
    //MARK: - Others
        
    override func viewWillLayoutSubviews() {
        backgroundGradientlayer.frame = view.bounds
    }
    
    //MARK: - IBActions
    @IBAction func plusButtonDidTap(_ sender: UIButton) {
        
    }
    
    @IBAction func editBarButtonDidTap(_ sender: UIBarButtonItem) {
        
        if collectionViewIsEditing == false {
            
            editBarButtonItem.title = "Done"
            collectionViewIsEditing = true
            
        } else {
            
            editBarButtonItem.title = "Edit"
            collectionViewIsEditing = false
            
        }
        
        editingModeToCollecionView()
        
    }
}

//MARK: - UICollectionViewDataSource
extension FridgeViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if section == 1 {
            
            return 1
            
        }
        
        return fridgeViewModel.dataArray.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.section == 1 {
            
            let upgradeCell = collectionView.dequeueReusableCell(withReuseIdentifier: "UpgradeCell", for: indexPath)
            
            return upgradeCell
            
        }
        
        let ingredientItem = collectionView.dequeueReusableCell(withReuseIdentifier: "IngredientCell", for: indexPath) as! IngredientCollectionViewCell
        
        ingredientItem.nameLabel.text = fridgeViewModel.dataArray[indexPath.row].name
        ingredientItem.descriptionLabel.text = fridgeViewModel.dataArray[indexPath.row].description
        ingredientItem.itemRow = indexPath.row
        ingredientItem.itemEditingDelegate = self as? ItemEditingDelegate
        
        return ingredientItem
    }
    
}
//MARK: - Delegates

//MARK: - ItemEditingDelegate

extension FridgeViewController: ItemEditingDelegate {
    
    func deleteItem(at row: Int) {
        
        let indexPath = IndexPath(row: row, section: 0)
        
        print("Remove at row: \(row)")
        
        ingredientsCollectionView.performBatchUpdates({
            
            fridgeViewModel.dataArray.remove(at: row)
            let ip = IndexPath(item: row, section: 0)
            self.ingredientsCollectionView.deleteItems(at: [ip])
            
        }, completion: { completed in
        
            self.ingredientsCollectionView.reloadData()
        
        })
        
    }
    
}

//MARK: - UICollectionViewDelegate
extension FridgeViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        ingredientsCollectionView.deselectItem(at: indexPath, animated: true)
        
        if indexPath.section == 1 {
            
            handleUpgradeItemTap()
            
        } else {
            
            handleIngredientItemTap()
            
        }
        
        let item = ingredientsCollectionView.cellForItem(at: indexPath)
        
        //Implement animated transforming of the cell while reacting to the touch
        UIView.animate(withDuration: 0.1,
                       delay: 0.0,
                       usingSpringWithDamping: 0.8,
                       initialSpringVelocity: 0.1,
                       options: [.beginFromCurrentState],
                       animations: {
            
            item?.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
            
        }, completion: { completion in
            
            UIView.animate(withDuration: 0.3,
                           delay: 0.0,
                           usingSpringWithDamping: 0.8,
                           initialSpringVelocity: 0.1,
                           options: [.beginFromCurrentState],
                           animations: {
                            
                            item?.transform = CGAffineTransform.identity
                            
            }, completion: nil)
            
        })
        
    }
        
}

//MARK: - UICollectionViewLayoutDelegate

extension FridgeViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if indexPath.section == 1 {
            
            let size = CGSize(width: self.view.frame.width - 20, height: 54)
            return size
        }
        
        let screenEdgeInset = 10
        
        let compactScreenWidth: CGFloat = self.view.frame.width - CGFloat(screenEdgeInset * 2)
        let regularScreenWidth: CGFloat = 320
        
        let height: CGFloat = 86
        
        //If device is in portrait on iphone, display items with width, related to screen width
        if self.traitCollection.horizontalSizeClass == UIUserInterfaceSizeClass.compact && self.traitCollection.verticalSizeClass != UIUserInterfaceSizeClass.compact {
            
            return CGSize(width: compactScreenWidth, height: height)
            
        }
        
        let size = CGSize(width: regularScreenWidth, height: height)
        
        return size
    }
    
}










