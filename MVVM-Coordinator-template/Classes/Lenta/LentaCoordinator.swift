//
//  LentaCoordinator.swift
//  MVVM-Coordinator-template
//
//  Created by Maxim Spiridonov on 03/03/2019.
//  Copyright © 2019 Maxim Spiridonov. All rights reserved.
//

import UIKit
import RxSwift


class LentaCoordinator: NavigationCoordinator {
    
    var recipeCoordinator: RecipeCoordinator?
    override init(_ navigationController: UINavigationController?) {
        super.init(navigationController)
    }
    override func start() -> Observable<Void> {
        
        let viewModel = LentaViewModel()
        
        let viewController = LentaViewController.initFromStoryboard(name: "Main")
        viewController.viewModel = viewModel
        viewModel.showRecipe
            .subscribe(onNext: { [weak self] in self?.showRecipe(by: $0) })
            .disposed(by: disposeBag)
        self.rootViewController = viewController
        navigationController?.pushViewController(rootViewController!, animated: true)
        return Observable.never()
    }
    private func showRecipe(by recipe: Recipe) {
        
        recipeCoordinator = RecipeCoordinator(self.navigationController, recipe)
        recipeCoordinator?.start()
//        let viewController = RecipeViewController.initFromStoryboard(name: "Main")
//
//        viewController.viewModel = RecipeViewModel(recipe)
//        viewController.viewModel.hiddenRecipe
//            .subscribe(onNext: { [weak self] in self?.hiddenRecipe(by: $0) })
//            .disposed(by: disposeBag)
//
//        viewController.title = recipe.title
//        super.rootViewController?.navigationController?.pushViewController(viewController, animated: true)
        
//        self.rootViewController?.navigationController?.pushViewController(viewController, animated: true)s
//        super.navigationController?.pushViewController(viewController, animated: true)
    }
    
}


