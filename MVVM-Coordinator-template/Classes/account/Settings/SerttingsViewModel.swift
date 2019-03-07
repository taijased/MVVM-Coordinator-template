//
//  SerttingsViewModel.swift
//  MVVM-Coordinator-template
//
//  Created by Maxim Spiridonov on 06/03/2019.
//  Copyright © 2019 Maxim Spiridonov. All rights reserved.
//
import Foundation
import RxSwift


class SettingsViewModel  {
    
    // MARK: - Inputs
    let selectCategory: AnyObserver<SettingCategory>
    // MARK: - Outputs
    let showSettingCategory: Observable<SettingCategory>
    var category: Observable<[SettingCategory]>
    
    init() {

        let _selectCategory = PublishSubject<SettingCategory>()
        self.selectCategory = _selectCategory.asObserver()
        self.showSettingCategory = _selectCategory.asObservable()
        
        let category = [SettingCategory(title: "Уведомления", iconUrl: "notifications"),
                        SettingCategory(title: "Реклама", iconUrl: "notifications"),
                        SettingCategory(title: "Аккаунт", iconUrl: "notifications"),
                        SettingCategory(title: "Справка", iconUrl: "notifications"),
                        SettingCategory(title: "Информация", iconUrl: "notifications")]
        
        self.category = Observable.just(category)
    }
}

