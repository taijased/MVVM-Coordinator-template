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
    let categoryCoordinator2: CategoryCoordinator
    
    
    override init(window: UIWindow){
        
        tabController = MainTabBarController.initFromStoryboard(name: "Main")
        
        categoryCoordinator = CategoryCoordinator()
        categoryCoordinator.start()
        
        categoryCoordinator2 = CategoryCoordinator()
        categoryCoordinator2.start()
        
        var controllers: [UIViewController] = []
        
        let categoryListViewController = categoryCoordinator.rootViewController!
        let categoryListViewController2 = categoryCoordinator2.rootViewController!
        
        TabCoordinator.setTabProperty(viewController: categoryListViewController, title: "Category")
        TabCoordinator.setTabProperty(viewController: categoryListViewController2, title: "Category2")
        
        controllers.append(categoryListViewController.navigationController!)
        controllers.append(categoryListViewController2.navigationController!)
        
        tabController.viewControllers = controllers
        tabController.tabBar.isTranslucent = false
        super.init(window: window)
    }
    
    
    
    static func setTabProperty(viewController: UIViewController, title: String) {
        
        let defaultImage = UIImage(named: "categories")!
        
        let selectedImage = UIImage(named: "categories")!

        let tabBarItems = (title: title, image: defaultImage, selectedImage: selectedImage)

        let tabBarItem = UITabBarItem(title: tabBarItems.title, image: tabBarItems.image, selectedImage: tabBarItems.selectedImage)

        viewController.tabBarItem = tabBarItem
        
    }
    
    var coordinators: [BaseCoordinator<Void>] {
        return [categoryCoordinator, categoryCoordinator2]
    }
    
    override func start() -> Observable<Void> {
        
        self.rootViewController = tabController
        
        window.rootViewController = tabController
        window.makeKeyAndVisible()
        return Observable.never()
    }
    
}

