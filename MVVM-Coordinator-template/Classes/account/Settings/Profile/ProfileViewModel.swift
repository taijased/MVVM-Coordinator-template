//
//  ProfileViewModel.swift
//  MVVM-Coordinator-template
//
//  Created by Maxim Spiridonov on 06/03/2019.
//  Copyright © 2019 Maxim Spiridonov. All rights reserved.
//

import Foundation
import RxSwift

class ProfileViewModel  {
    // MARK: - Inputs
    
    let cancel: AnyObserver<Void>
    let save: AnyObserver<Void>
    
    // MARK: - Outputs
    
    let didCancel: Observable<Void>
    let didSave: Observable<Void>
    
    init() {
        
        let _cancel = PublishSubject<Void>()
        self.cancel = _cancel.asObserver()
        self.didCancel = _cancel.asObservable()
        
        let _save = PublishSubject<Void>()
        self.save = _save.asObserver()
        self.didSave = _save.asObservable()
        //        to do
        
    }
}

