//
//  RecipeViewModel.swift
//  MVVM-Coordinator-template
//
//  Created by Maxim Spiridonov on 03/03/2019.
//  Copyright © 2019 Maxim Spiridonov. All rights reserved.
//
import Foundation


class RecipeViewModel  {
    
    var recipe: Recipe
    
    init(_ recipe: Recipe) {
        self.recipe = recipe
    }
}
