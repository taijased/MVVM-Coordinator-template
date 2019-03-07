//
//  AccauntCoordinator.swift
//  MVVM-Coordinator-template
//
//  Created by Maxim Spiridonov on 04/03/2019.
//  Copyright © 2019 Maxim Spiridonov. All rights reserved.
//


import UIKit
import RxSwift


class AccountCoordinator: NavigationCoordinator {
    
    var settingsCoordinator: SettingsCoordinator?
    
    
    override init(_ navigationController: UINavigationController?) {
        super.init(navigationController)
    }
    override func start() -> Observable<Void> {
        
        let viewModel = AccountViewModel()
        let viewController = AccountViewController.initFromStoryboard(name: "Main")
        viewController.viewModel = viewModel
        viewModel.didSetting
            .subscribe(onNext: { [weak self] in self?.showSettingsScreen() })
            .disposed(by: disposeBag)
        self.rootViewController = viewController
        navigationController?.pushViewController(rootViewController!, animated: true)
        return Observable.never()
    }
    private func showSettingsScreen() {
        settingsCoordinator = SettingsCoordinator(self.navigationController)
        settingsCoordinator?.start()
    }
}
