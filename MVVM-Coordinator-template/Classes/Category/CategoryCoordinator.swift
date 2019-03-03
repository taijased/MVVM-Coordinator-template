//
//  CategoryCoordinator.swift
//  MVVM-Coordinator-template
//
//  Created by Maxim Spiridonov on 03/03/2019.
//  Copyright © 2019 Maxim Spiridonov. All rights reserved.
//


import UIKit
import RxSwift


class CategoryCoordinator: NavigationCoordinator {
    
    override init(_ navigationController: UINavigationController?) {
        super.init(navigationController)
    }
    override func start() -> Observable<Void> {
        
        let viewModel = CategoryListViewModel()
        let viewController = CategoryListViewController.initFromStoryboard(name: "Main")
        viewController.viewModel = viewModel
        viewModel.showCategoryRecipes
            .subscribe(onNext: { [weak self] in self?.showCategoryRecipes(by: $0) })
            .disposed(by: disposeBag)
        
        self.rootViewController = viewController
        
        navigationController?.pushViewController(rootViewController!, animated: true)
        return Observable.never()
    }
    private func showCategoryRecipes(by category: Category) {
        let viewController = CRListViewController.initFromStoryboard(name: "Main")
        viewController.viewModel = CRListViewModel(category: category)
        viewController.title = category.title
        super.navigationController?.pushViewController(viewController, animated: true)
    }
    
    
}


