//
//  LentaViewController.swift
//  MVVM-Coordinator-template
//
//  Created by Maxim Spiridonov on 03/03/2019.
//  Copyright © 2019 Maxim Spiridonov. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import Kingfisher


class LentaViewController: UIViewController, StoryboardInitializable, UICollectionViewDelegate {
    
    let disposeBag = DisposeBag()
    var viewModel: LentaViewModel!
    private let refreshControl = UIRefreshControl()
    var fetchingMore: Bool = false
    let cellIdentifier = "lentaCell"
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBindings()
        
        self.collectionView!.alwaysBounceVertical = true
        self.refreshControl.tintColor = LM_COLOR
        refreshControl.sendActions(for: .valueChanged)
//        self.refreshControl.addTarget(self, action: #selector(loadData), for: .valueChanged)
        self.collectionView!.addSubview(refreshControl)
//        viewModel.cl.onNext("asd")
        
    }
    
    private func setupBindings() {
        viewModel.recipes
            .observeOn(MainScheduler.init())
            .do(onNext: { [weak self] _ in
                self?.refreshControl.endRefreshing()
            })
            .bind(to: collectionView.rx.items(cellIdentifier: self.cellIdentifier, cellType: LentaCell.self)) { (_, recipe, cell) in
                self.setupRecipeCell(cell, recipe)
            }
            .disposed(by: disposeBag)
        
        refreshControl.rx.controlEvent(.valueChanged)
            .bind(to: viewModel.reload)
            .disposed(by: disposeBag)
        collectionView.rx.modelSelected(Recipe.self)
            .bind(to: viewModel.selectRecipe)
            .disposed(by: disposeBag)
    }
    
    private func setupRecipeCell(_ cell: LentaCell, _ recipe: Recipe) {
        print("cell")
        cell.recipeTitle?.text = recipe.title
        cell.recipeAuthor.text = recipe.author
        cell.recipeTime.text = String(recipe.timing) + " минут"
        cell.recipeLike.text = String(recipe.likeCount)
        cell.recipeChat.text = String(recipe.commentCount)
        
        if recipe.isNew {
            cell.recipeNew.layer.cornerRadius = 13

        } else {
            //            cell.recipeNew.layer.isHidden = true
            cell.recipeNew.backgroundColor = UIColor.red
        }
        DispatchQueue.global().async {
            let url = URL(string: recipe.imageUrl)
            DispatchQueue.main.async {
                cell.recipeImage.kf.setImage(with: url)
            }
        }
    }
    
    @objc func loadData() {
        print("refresh")
        stopRefresher()
    }
    
    func stopRefresher() {
        self.refreshControl.endRefreshing()
    }
    
    
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        print("scrollViewDidScroll")
        if offsetY > contentHeight - scrollView.frame.height * 2 {

            if !fetchingMore {
                fetchingMore = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.25, execute: {
//                    self.viewModel.fetchMore()
                    print("scroll")
                    self.fetchingMore = false
                })
            }
        }
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
