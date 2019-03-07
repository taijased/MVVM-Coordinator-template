//
//  SettingsCoordinator.swift
//  MVVM-Coordinator-template
//
//  Created by Maxim Spiridonov on 06/03/2019.
//  Copyright © 2019 Maxim Spiridonov. All rights reserved.
//

import UIKit
import RxSwift

class SettingsCoordinator: NavigationCoordinator {
    
    
    override init(_ navigationController: UINavigationController?) {
        super.init(navigationController)
    }
    override func start() -> Observable<Void> {
        
        let viewModel = SettingsViewModel()
        let viewController = SettingsViewController.initFromStoryboard(name: "Main")
        viewController.viewModel = viewModel
        
        viewModel.showSettingCategory
            .subscribe(onNext: { [weak self] in self?.screenSettingCategory(by: $0) })
            .disposed(by: disposeBag)
        
//        viewModel.didCancel
//            .subscribe(onNext: { [weak self] in self?.hiddenSettingsScreen() })
//            .disposed(by: disposeBag)
        
        
        self.rootViewController = viewController
//        navigationController?.present(viewController, animated: true)
        navigationController?.pushViewController(rootViewController!, animated: true)
        
        return Observable.never()
    }
    
    private func screenSettingCategory(by category: SettingCategory) {
        
        
        switch category.title {
        case "Аккаунт":
            openScreenProfile(category)
            break
        default:
            break
        }

        
    }
    
    private func openScreenProfile(_ category: SettingCategory) {
        print(category.title)
        let viewController = ProfileViewController.initFromStoryboard(name: "Main")
        viewController.viewModel = ProfileViewModel()
        viewController.title = category.title
        
        viewController.viewModel.didCancel
            .subscribe(onNext: { [weak self] in self?.rootViewController?.dismiss(animated: true, completion: nil) })
            .disposed(by: disposeBag)
        
        viewController.viewModel.didSave
            .subscribe(onNext: { [weak self] in self?.saveSettingsProfile() })
            .disposed(by: disposeBag)
        
        
        navigationController?.present(viewController, animated: true)
    }
    private func saveSettingsProfile() {
        self.rootViewController?.dismiss(animated: true, completion: nil)
    }
    
}
