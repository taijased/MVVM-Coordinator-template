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
        /// Call to reload repositories.
        
        
        
        let reload: AnyObserver<Void>
        let page: AnyObserver<Int>
        
        
        
        
//        let cl: AnyObserver<String>
        // MARK: - Outputs
        let showRecipe: Observable<Recipe>
        
    //    let setRecipe: Observable<[Recipe]>
        
        
        var recipes: Observable<[Recipe]>
        
        var test: [Recipe]
        
        var pageValue: Int = 1
        
        
        
        
        
        
        init(workshop: WorkshopAPI = WorkshopAPI()) {
            
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
                        workshop.fetchRecipes2(page: self.pageValue, count: self.count)
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

            
            
            
            
            
//            let _currentLanguage = BehaviorSubject<String>(value: "dssd")
//            self.cl = _currentLanguage.asObserver()
//
//
//
//            self.recipes = Observable.combineLatest( _reload, _currentLanguage) { _, language in language }
//                .flatMapLatest { language in
//                    workshop.fetchRecipes2(page: 1, count: 16)
//                        .catchError { error in
//                            print(error.localizedDescription)
//                            return Observable.empty()
//                    }
//                }
//                .map { recipes in recipes }

            

    //        self.recipes = Observable.
    //        self.recipes = _recipes.asObservable()
    //            .
    //        let _setRecipes = PublishSubject<[Recipe]>()
    //        self.recipes = _setRecipes.asObserver()
    //        self.setRecipe = _setRecipes.asObservable()
    //            .do(onNext: { [weak self] _ in
    //                Observable.just(self?.dataManager.fetchRecipes(page: self!.page, count: self!.count))
    //            })
    //
//           fetch2()
        }
        
        
        func fetch2() {
//            dataManager.fetchRecipes2(page: 1, count: count)
//                .subscribe(onNext: {  [weak self] recipes in self?.recipes = Observable.just(recipes)})
//                .disposed(by : DisposeBag())
        }
        
    //    func fetch(){
    //        print("asd")
    ////        self.recipes = Observable.just(dataManager.fetchRecipes(page: page, count: count))
    //        print("asd2")
    //    }
    //    private func fetcht() -> Observable<[Recipe> {
    //        // For simplicity we will use a stubbed list of languages.
    //
    //
    //        let recipe = [Recipe(isLiked: true, isNew: true, commentCount: 34, imageUrl: "", likeCount: 42, title: "Стулья Тимура", author: "Тимур Загиров", timing: 69, guid: "alogdanm"),
    //                      Recipe(isLiked: true, isNew: true, commentCount: 34, imageUrl: "", likeCount: 42, title: "Диваны", author: "Имашев Александр", timing: 69, guid: "alogdanm"),
    //                      Recipe(isLiked: true, isNew: true, commentCount: 34, imageUrl: "", likeCount: 42, title: "Шкафы", author: "Спиридонов Максим", timing: 69, guid: "alogdanm")]
    //
    //        return Observable.just(recipe)
    //    }
     
    //
    //
        
        
        
        
        
    //    func fetchMore () {
    //        dataManager.fetchRecipes(page: self.page, count: self.count) { [weak self] items in
    ////            self?.recipes += !items.isEmpty ? Observable.just(items) : Observable.just([])
    ////            how to concat array rxswift
    //            print("infinityScroll")
    //            self?.page += 1
    //        }
    //    }
    }

