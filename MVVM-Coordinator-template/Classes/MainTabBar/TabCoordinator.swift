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
    let notificationCoordinator: NotificationCoordinator
    let accountCoordinator: AccountCoordinator
    
    
    override init(window: UIWindow){
        
        tabController = MainTabBarController.initFromStoryboard(name: "Main")
        
        
        lentaCoordinator = LentaCoordinator(tabController.navigationController)
        lentaCoordinator.start()
        
        categoryCoordinator = CategoryCoordinator(tabController.navigationController)
        categoryCoordinator.start()
        
        notificationCoordinator = NotificationCoordinator(tabController.navigationController)
        notificationCoordinator.start()
        
        accountCoordinator = AccountCoordinator(tabController.navigationController)
        accountCoordinator.start()
        
        
        super.init(window: window)
        
        setupControllers()
    
        
        
    }
    private func setupControllers() {
        var controllers: [UIViewController] = []
        
        let categoryListViewController = categoryCoordinator.rootViewController!
        let lentaViewController = lentaCoordinator.rootViewController!
        let notificationViewController = notificationCoordinator.rootViewController!
        let accountViewController = accountCoordinator.rootViewController!
        
        setTabProperty(viewController: categoryListViewController, defaultImage: UIImage(named: "categories")!)
        setTabProperty(viewController: lentaViewController, defaultImage: UIImage(named: "home")!)
        setTabProperty(viewController: notificationViewController, defaultImage: UIImage(named: "notifications")!)
        setTabProperty(viewController: accountViewController, defaultImage: UIImage(named: "user")!)
        
        
        
        controllers.append(accountViewController.navigationController!)
        controllers.append(lentaViewController.navigationController!)
        controllers.append(categoryListViewController.navigationController!)
        controllers.append(notificationViewController.navigationController!)
        
        
        
       
        tabController.viewControllers = controllers
        tabController.tabBar.isTranslucent = false
        tabController.tabBar.tintColor = LM_COLOR
//        add above shadow box
        
//        tabController.tabBar.layer.opacity = 0.9
        
        
        tabController.tabBar.layer.shadowColor = UIColor.black.cgColor
        tabController.tabBar.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        tabController.tabBar.layer.shadowRadius = 5
        tabController.tabBar.layer.shadowOpacity = 0.25
        tabController.tabBar.layer.masksToBounds = false
        
        
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

