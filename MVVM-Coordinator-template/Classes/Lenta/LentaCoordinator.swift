//
//  LentaCoordinator.swift
//  MVVM-Coordinator-template
//
//  Created by Maxim Spiridonov on 03/03/2019.
//  Copyright © 2019 Maxim Spiridonov. All rights reserved.
//

import UIKit
import RxSwift
import SafariServices

class LentaCoordinator: BaseCoordinator<Void> {
    
    
    private let navigationController: UINavigationController?
    public var tb: UITabBarController?
    
    override init() {
        self.navigationController = UINavigationController()
        
    }
    override func start() -> Observable<Void> {
        
        let viewModel = CategoryListViewModel()
        let viewController = CategoryListViewController.initFromStoryboard(name: "Main")
        viewController.viewModel = viewModel
        viewModel.showCategoryRecipes
            .subscribe(onNext: { [weak self] in self?.showCategoryRecipes(by: $0) })
            .disposed(by: disposeBag)
        
        self.rootViewController = viewController
        
        self.navigationController?.viewControllers = [rootViewController!]
        return Observable.never()
    }
    private func showCategoryRecipes(by category: Category) {
        let viewController = CRListViewController.initFromStoryboard(name: "Main")
        viewController.viewModel = CRListViewModel(category: category)
        viewController.title = category.title
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    
}



