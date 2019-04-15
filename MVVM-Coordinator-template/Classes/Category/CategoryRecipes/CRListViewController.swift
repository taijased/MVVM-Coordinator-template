//
//  CRListViewController.swift
//  MVVM-Coordinator-template
//
//  Created by Maxim Spiridonov on 03/03/2019.
//  Copyright © 2019 Maxim Spiridonov. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
//import Kingfisher

class CRListViewController: UIViewController, StoryboardInitializable {
    
    var viewModel: CRListViewModel!
    let disposeBag = DisposeBag()
    let cellIdentifier = "crListCell"
    
    @IBOutlet weak var collectionView: UICollectionView!
    private let refreshControl = UIRefreshControl()
    var fetchingMore: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView!.alwaysBounceVertical = true
        self.refreshControl.tintColor = LM_COLOR
        refreshControl.sendActions(for: .valueChanged)
//        self.refreshControl.addTarget(self, action: #selector(loadData), for: .valueChanged)
        self.collectionView!.addSubview(refreshControl)
        collectionView!.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 50, right: 0)
        setupBindings()
    }
    
    private func setupBindings() {
//        viewModel.recipes
//            .observeOn(MainScheduler.instance)
//            .do(onNext: { [weak self] _ in self?.refreshControl.endRefreshing() })
//            .bind(to: collectionView.rx.items(cellIdentifier: self.cellIdentifier, cellType: CRListCell.self)) { (_, recipe, cell) in
//                self.setupRecipeCell(cell, recipe)
//            }
//            .disposed(by: disposeBag)
        viewModel.recipes
            .observeOn(MainScheduler.instance)
            .do(onNext: { [weak self] _ in self?.refreshControl.endRefreshing() })
//
            .bind(to: collectionView.rx.items) { (collectionView, row, element) in
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.cellIdentifier, for: IndexPath(row: row, section: 0)) as! CRListCell
                
                self.setupRecipeCell(cell, element)
                return cell
            }
            .disposed(by: disposeBag)
            
        refreshControl.rx.controlEvent(.valueChanged)
            .bind(to: viewModel.reload)
            .disposed(by: disposeBag)
        collectionView.rx.modelSelected(Recipe.self)
            .bind(to: viewModel.selectRecipe)
            .disposed(by: disposeBag)
    }
    
    private func setupRecipeCell(_ cell: CRListCell, _ recipe: Recipe) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            DispatchQueue.global().async {
                let url = URL(string: recipe.imageUrl)
                DispatchQueue.main.async {
                    cell.contentView.hideSkeleton()
                    cell.recipeImage.kf.setImage(with: url)
                    cell.recipeTitle?.text = recipe.title
                    cell.recipeTime.text = String(recipe.timing) + " минут"
                }
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
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
}
