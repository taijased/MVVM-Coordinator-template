//
//  LentaViewModel.swift
//  MVVM-Coordinator-template
//
//  Created by Maxim Spiridonov on 03/03/2019.
//  Copyright © 2019 Maxim Spiridonov. All rights reserved.
//


import Foundation
import RxSwift

class LentaViewModel  {
    
    private let dataManager: WorkshopAPI
    private var page: Int = 1
    private var count: Int = 3
    var infinity: Bool = true
    
    
    // MARK: - Inputs
    let selectRecipe: AnyObserver<Recipe>
    // MARK: - Outputs
    let showRecipe: Observable<Recipe>
    var recipes: Observable<[Recipe]>
    
    init() {
        
        let _selectRecipe = PublishSubject<Recipe>()
        self.selectRecipe = _selectRecipe.asObserver()
        self.showRecipe = _selectRecipe.asObservable()
        self.dataManager = WorkshopAPI()
        
        let recipe = [Recipe(isLiked: true, isNew: true, commentCount: 34, imageUrl: "", likeCount: 42, title: "Стулья Тимура", author: "Тимур Загиров", timing: 69, guid: "alogdanm"),
                      Recipe(isLiked: true, isNew: true, commentCount: 34, imageUrl: "", likeCount: 42, title: "Диваны", author: "Имашев Александр", timing: 69, guid: "alogdanm"),
                      Recipe(isLiked: true, isNew: true, commentCount: 34, imageUrl: "", likeCount: 42, title: "Шкафы", author: "Спиридонов Максим", timing: 69, guid: "alogdanm")]
        self.recipes = Observable.just(recipe)
        
//        self.recipes = Observable.just([])
        fetch()
    }
    
    func fetch () {
        dataManager.fetchRecipes(page: 1, count: self.count) { [weak self] items in
            print("fetch")
            self?.recipes = !items.isEmpty ? Observable.just(items) : Observable.just([])
            self?.page += 1
            
        }
    }
    func fetchMore () {
        dataManager.fetchRecipes(page: self.page, count: self.count) { [weak self] items in
//            self?.recipes += !items.isEmpty ? Observable.just(items) : Observable.just([])
//            how to concat array rxswift
            print("infinityScroll")
            self?.page += 1
        }
    }
    
    
}

