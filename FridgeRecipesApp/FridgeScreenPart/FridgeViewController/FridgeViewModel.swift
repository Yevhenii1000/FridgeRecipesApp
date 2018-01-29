//
//  FridgeViewModel.swift
//  FridgeRecipesApp
//
//  Created by Yevhenii on 27.11.2017.
//  Copyright © 2017 Yevhenii. All rights reserved.
//

import Foundation

class FridgeViewModel {
    
    var dataArray = [IngredientUnit(name: "Celery", description: "Healthy and dietary product"), IngredientUnit(name: "Cucumbers", description: "Healthy and dietary product"), IngredientUnit(name: "Tomatos", description: "Healthy and dietary product"), IngredientUnit(name: "Quinoa", description: "Healthy and dietary product"), IngredientUnit(name: "Oats", description: "Healthy and dietary product")]
    
}

struct IngredientUnit {
    
    var name: String
    var description: String
    
}

