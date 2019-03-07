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
//        private var page: Int = 1
        private var count: Int = 3
        var infinity: Bool = true

        // MARK: - Inputs
        let selectRecipe: AnyObserver<Recipe>
   
        
        let reload: AnyObserver<Void>
        
        let page: AnyObserver<Int>

        // MARK: - Outputs
        let showRecipe: Observable<Recipe>
        var recipes: Observable<[Recipe]>
        var pageValue: Int = 1
        
        var test: [Recipe]

        init() {
            
            let _selectRecipe = PublishSubject<Recipe>()
            self.selectRecipe = _selectRecipe.asObserver()
            self.showRecipe = _selectRecipe.asObservable()
            self.dataManager = WorkshopAPI()
            
            self.test = []
            
            let _reload = PublishSubject<Void>()
            self.reload = _reload.asObserver()
            
            
            let _currentPage = BehaviorSubject<Int>(value: 1)
            self.page = _currentPage.asObserver()
            
            self.recipes = Observable.just([])
            self.recipes = Observable.combineLatest( _reload, _currentPage) { _, page in page }
                .flatMapLatest { page in
                        self.dataManager.fetchRecipes2(page: page, count: self.count)
                            .catchError { error in
                                print(error.localizedDescription)
                                return Observable.empty()
                        }
                    }
                    .map { [weak self] recipes in
                        self?.pageValue += 1
                        self!.test.append(contentsOf: recipes)
                        return (self?.test)!
            }

        }

    }

