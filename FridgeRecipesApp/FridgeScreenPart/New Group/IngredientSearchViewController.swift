//
//  IngredientSearchViewController.swift
//  FridgeRecipesApp
//
//  Created by Yevhenii on 18.01.2018.
//  Copyright © 2018 Yevhenii. All rights reserved.
//

import UIKit

class IngredientSearchViewController: UIViewController {

    @IBOutlet weak var ingredientSearchBar: UISearchBar!
    @IBOutlet weak var ingredientSearchTableView: UITableView!
    @IBOutlet weak var tableBackgroundView: UIView!
    
    let ingredientsViewModel = IngredientSearchViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableBackgroundView.layer.cornerRadius = 15
        tableBackgroundView.clipsToBounds = true
        
        ingredientSearchTableView.allowsSelection = false
        ingredientSearchTableView.separatorStyle = .none
        
        ViewParallaxEffect.applyMotionEffect(toView: tableBackgroundView, withMagnitude: 35.0)
        
        registerIngredientCell()
    }
    
    //MARK: - UI
    
    override func viewWillAppear(_ animated: Bool) {
        
        let transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        self.tableBackgroundView.transform = transform
        
        UIView.animate(withDuration: 0.35,
                       delay: 0,
                       usingSpringWithDamping: 0.7,
                       initialSpringVelocity: 0.5,
                       options: [.curveEaseInOut],
                       animations: {
                        
                        self.tableBackgroundView.transform = CGAffineTransform.identity
                        
        },
                       completion: nil)
    }
    //MARK: - TableView Set Up
    
    func registerIngredientCell() {
        
        let nib = UINib(nibName: "IngredientResultTableViewCell", bundle: nil)
        
        ingredientSearchTableView.register(nib, forCellReuseIdentifier: "IngredientResultTableViewCell")
        
    }
    
    //MARK: - Actions
    
    @IBAction func dismissButtonDidTap(_ sender: UIButton) {
        
        UIView.animate(withDuration: 0.15, delay: 0,
                       options: [.curveEaseInOut],
                       animations: {
                        let transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
                        self.tableBackgroundView.transform = transform
                        self.tableBackgroundView.layer.opacity = 0.0
        },
                       completion: { completed in
                        
                        self.presentingViewController?.dismiss(animated: true, completion: nil)
                                                
        })
        
    }

}

extension IngredientSearchViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ingredientsViewModel.ingredientsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "IngredientResultTableViewCell") as! IngredientResultTableViewCell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 54
    }
    
}

extension IngredientSearchViewController: UITableViewDelegate {
    
    
    
}
