//
//  CoordinatorProtocol.swift
//  MVVM-Coordinator-template
//
//  Created by Maxim Spiridonov on 03/03/2019.
//  Copyright © 2019 Maxim Spiridonov. All rights reserved.
//


import Foundation
import RxSwift
import UIKit

protocol CoordinatorProtocol {
    func start(from viewController: UIViewController) -> Observable<Void>
    func coordinate(to coordinator: CoordinatorProtocol, from viewController: UIViewController) -> Observable<Void>
}
