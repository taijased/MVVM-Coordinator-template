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
    let selectNotification: AnyObserver<Notification>
    // MARK: - Outputs
    let showNotification: Observable<Notification>
    var notification: Observable<[Notification]>
    
    init() {
        self.notification = Observable.just([])
        let _selectNotification = PublishSubject<Notification>()
        self.selectNotification = _selectNotification.asObserver()
        self.showNotification = _selectNotification.asObservable()
        
        fetchCategory()
    }
    
    func fetchCategory(){
        
        let notification = [Notification(title: "Алена Нам начала проходить квест Звездный десант ", time: "4 часа назад"),
                            Notification(title: "Алексей Антипин приглашает вас пройти квест Дожить до рассвета", time: "2 часа назад"),
                            Notification(title: "Александр Имашев прошел квест В поисках потерянной локации и оставил отзыв", time: "2  дня назад"),
                            Notification(title: "Артем Новиков приглашает вас пройти квест Выйди из комнаты", time: "вчера")]
        
        self.notification = Observable.just(notification)
        
    }
    
    
    
}
