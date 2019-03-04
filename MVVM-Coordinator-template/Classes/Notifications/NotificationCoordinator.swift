//
//  NotificationCoordinator.swift
//  MVVM-Coordinator-template
//
//  Created by Maxim Spiridonov on 04/03/2019.
//  Copyright © 2019 Maxim Spiridonov. All rights reserved.
//


import UIKit
import RxSwift


class NotificationCoordinator: NavigationCoordinator {
    
    
    
    override init(_ navigationController: UINavigationController?) {
        super.init(navigationController)
    }
    override func start() -> Observable<Void> {
        
        let viewModel = NotificationViewModel()
        let viewController = NotificationViewController.initFromStoryboard(name: "Main")
        viewController.viewModel = viewModel
        viewModel.showNotification
            .subscribe(onNext: { [weak self] in self?.showNotification(by: $0) })
            .disposed(by: disposeBag)
        
        self.rootViewController = viewController
        
        navigationController?.pushViewController(rootViewController!, animated: true)
        return Observable.never()
    }
    private func showNotification(by notification: Notification) {
        print(notification.title)
        
//        let viewController = CRListViewController.initFromStoryboard(name: "Main")
//        viewController.viewModel = CRListViewModel(category: category)
//        viewController.title = category.title
//        viewController.viewModel.showRecipe
//            .subscribe(onNext: { [weak self] in self?.showRecipe(by: $0) })
//            .disposed(by: disposeBag)
//        super.navigationController?.pushViewController(viewController, animated: true)
    }
 
}


