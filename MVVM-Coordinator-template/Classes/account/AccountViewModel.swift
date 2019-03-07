//
//  AccountViewModel.swift
//  MVVM-Coordinator-template
//
//  Created by Maxim Spiridonov on 04/03/2019.
//  Copyright © 2019 Maxim Spiridonov. All rights reserved.
//
import Foundation
import RxSwift

class AccountViewModel  {
    
    // MARK: - Inputs
    
    let setting: AnyObserver<Void>
    
    // MARK: - Outputs
    
    let didSetting: Observable<Void>
    
    let user: User
    
    init() {
        let _setting = PublishSubject<Void>()
        self.setting = _setting.asObserver()
        self.didSetting = _setting.asObservable()
        
        self.user = User(name: "Иван Иванов", login: "taijased", followers: 134, following: 43)

    }
}
