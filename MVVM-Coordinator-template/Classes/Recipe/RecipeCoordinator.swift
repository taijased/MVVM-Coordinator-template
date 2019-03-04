//
//  RecipeCoordinator.swift
//  MVVM-Coordinator-template
//
//  Created by Maxim Spiridonov on 04/03/2019.
//  Copyright © 2019 Maxim Spiridonov. All rights reserved.
//


import UIKit
import RxSwift


class RecipeCoordinator: NavigationCoordinator {
    
    
    var recipe: Recipe
    
    init(_ navigationController: UINavigationController?, _ recipe: Recipe) {
        self.recipe = recipe
        super.init(navigationController)
    }
    override func start() -> Observable<Void> {
        
        let viewModel = RecipeViewModel(recipe)
        let viewController = RecipeViewController.initFromStoryboard(name: "Main")
        viewController.title = recipe.author
        viewController.viewModel = viewModel
        viewController.onSelectHidden = { [weak self] in
            self?.hiddenRecipe()
        }
        
        self.rootViewController = viewController
        navigationController?.present(viewController, animated: true)
        return Observable.never()
    }
    private func hiddenRecipe() {
        self.rootViewController?.dismiss(animated: true, completion: nil)
    }
}


