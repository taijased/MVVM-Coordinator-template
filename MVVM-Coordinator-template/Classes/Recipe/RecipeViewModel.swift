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
    
    let cancel: AnyObserver<Void>
    
    // MARK: - Outputs
    
    let didCancel: Observable<Void>
    
    
    
    var recipe: Recipe
    
    init(_ recipe: Recipe) {
        self.recipe = recipe
        
        let _cancel = PublishSubject<Void>()
        self.cancel = _cancel.asObserver()
        self.didCancel = _cancel.asObservable()
//        to do
        
    }
}
