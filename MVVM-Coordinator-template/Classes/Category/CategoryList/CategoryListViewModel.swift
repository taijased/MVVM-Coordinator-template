//
//  CategoryListViewModel.swift
//  MVVM-Coordinator-template
//
//  Created by Maxim Spiridonov on 03/03/2019.
//  Copyright © 2019 Maxim Spiridonov. All rights reserved.
//


import Foundation
import RxSwift

class CategoryListViewModel  {
    
    // MARK: - Inputs
    let selectCategory: AnyObserver<Category>
    // MARK: - Outputs
    let showCategoryRecipes: Observable<Category>
    var category: Observable<[Category]>
    
    init() {
        self.category = Observable.just([])
        let _selectCategory = PublishSubject<Category>()
        self.selectCategory = _selectCategory.asObserver()
        self.showCategoryRecipes = _selectCategory.asObservable()
        
        fetchCategory()
    }
    
    func fetchCategory(){
    
        let category = [Category(title: "Для детей", iconUrl: "carden"),
                        Category(title: "Для всей семьи", iconUrl: "carden"),
                        Category(title: "Для животных", iconUrl: "carden"),
                        Category(title: "Красим", iconUrl: "carden"),
                        Category(title: "Сад", iconUrl: "carden"),
                        Category(title: "Из дерева", iconUrl: "carden")]
    
        self.category = Observable.just(category)
        
    }
}

