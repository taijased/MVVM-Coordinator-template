//
//  RecipeViewModel.swift
//  MVVM-Coordinator-template
//
//  Created by Maxim Spiridonov on 03/03/2019.
//  Copyright © 2019 Maxim Spiridonov. All rights reserved.
//
import Foundation
import RxSwift

class RecipeViewModel  {
    
    // MARK: - Inputs
    let selectCloseTap: AnyObserver<Recipe>
    // MARK: - Outputs
    let hiddenRecipe: Observable<Recipe>
    
    
    init(_ recipe: Recipe) {
        
        let _selectCloseTap = PublishSubject<Recipe>()
        self.selectCloseTap = _selectCloseTap.asObserver()
        self.hiddenRecipe = _selectCloseTap.asObservable()
//        print(recipe)
    }
}
