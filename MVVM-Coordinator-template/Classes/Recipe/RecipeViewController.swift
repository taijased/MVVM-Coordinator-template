//
//  RecipeViewController.swift
//  MVVM-Coordinator-template
//
//  Created by Maxim Spiridonov on 03/03/2019.
//  Copyright © 2019 Maxim Spiridonov. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import Kingfisher


class RecipeViewController: UIViewController, StoryboardInitializable {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBindings()

    }
    
    private func setupBindings() {
//        viewModel.recipes
//            .observeOn(MainScheduler.instance)
//            .do(onNext: { [weak self] _ in self?.refreshControl.endRefreshing() })
//            .bind(to: collectionView.rx.items(cellIdentifier: "lentaCell", cellType: LentaCell.self)) { (_, recipe, cell) in
//                self.setupCategoryListCell(cell, recipe)
//            }
//            .disposed(by: disposeBag)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
}
