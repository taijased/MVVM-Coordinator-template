//
//  TabCoordinator.swift
//  MVVM-Coordinator-template
//
//  Created by Maxim Spiridonov on 03/03/2019.
//  Copyright © 2019 Maxim Spiridonov. All rights reserved.
//


import UIKit
import RxSwift

class TabCoordinator: AppCoordinator {
    
    
    
    let tabController: UITabBarController
    let categoryCoordinator: CategoryCoordinator
    let lentaCoordinator: LentaCoordinator
    
    
    override init(window: UIWindow){
        
        tabController = MainTabBarController.initFromStoryboard(name: "Main")
        
        lentaCoordinator = LentaCoordinator(tabController.navigationController)
        lentaCoordinator.start()
        
        categoryCoordinator = CategoryCoordinator(tabController.navigationController)
        categoryCoordinator.start()
        
        super.init(window: window)
        
        setupControllers()
    
        
        
    }
    private func setupControllers() {
        var controllers: [UIViewController] = []
        
        let categoryListViewController = categoryCoordinator.rootViewController!
        let lentaViewController = lentaCoordinator.rootViewController!
        
        setTabProperty(viewController: categoryListViewController, defaultImage: UIImage(named: "categories")!)
        setTabProperty(viewController: lentaViewController, defaultImage: UIImage(named: "home")!)

        controllers.append(lentaViewController.navigationController!)
        controllers.append(categoryListViewController.navigationController!)
        
        
        tabController.viewControllers = controllers
        tabController.tabBar.isTranslucent = false
//       to do set tab color selected
    }
    
    
    
    private func setTabProperty(viewController: UIViewController, defaultImage: UIImage) {
        let tabBarItem = UITabBarItem(title: "", image: defaultImage, selectedImage: defaultImage)
       
        viewController.tabBarItem = tabBarItem
    }
    

    override func start() -> Observable<Void> {
        
        self.rootViewController = tabController
        
        window.rootViewController = tabController
        window.makeKeyAndVisible()
        return Observable.never()
    }
    
}

