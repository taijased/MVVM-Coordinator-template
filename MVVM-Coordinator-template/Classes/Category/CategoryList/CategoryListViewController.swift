//
//  CategoryListViewController.swift
//  MVVM-Coordinator-template
//
//  Created by Maxim Spiridonov on 03/03/2019.
//  Copyright © 2019 Maxim Spiridonov. All rights reserved.
//
import UIKit
import RxSwift
import RxCocoa


class CategoryListViewController: UIViewController, StoryboardInitializable {
    let disposeBag = DisposeBag()
    var viewModel: CategoryListViewModel!
    @IBOutlet weak var collectionView: UICollectionView!
    private let refreshControl = UIRefreshControl()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBindings()
        setupNavigationBar()
        setupRefresher()
    }
    
    @objc func loadData() {
        viewModel.fetchCategory()
        stopRefresher()
    }
    
    func stopRefresher() {
        self.refreshControl.endRefreshing()
    }
    
    private func setupBindings() {
        viewModel.category
            .observeOn(MainScheduler.instance)
            .do(onNext: { [weak self] _ in self?.refreshControl.endRefreshing() })
            .bind(to: collectionView.rx.items(cellIdentifier: "categoryListCell", cellType: CategoryListCell.self)) { (_, category, cell) in
                self.setupCategoryListCell(cell, category)
            }
            .disposed(by: disposeBag)
        collectionView.rx.modelSelected(Category.self)
            .bind(to: viewModel.selectCategory)
            .disposed(by: disposeBag)
    }
    
    private func setupCategoryListCell(_ cell: CategoryListCell, _ category: Category) {
        cell.categoryTitle.text = category.title
    }
    
    
    func setupNavigationBar() {
        //        убрать линию нижнюю
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
        
        //        хуйня чтобы загрузить нашу стрелку
        self.navigationController?.navigationBar.backIndicatorImage = UIImage(named: "back")
        
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "back")
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItem.Style.plain, target: nil, action: nil)
        
        self.navigationController?.navigationBar.tintColor = UIColor.black
    }
    func setupRefresher() {
        self.collectionView!.alwaysBounceVertical = true
        self.refreshControl.tintColor = UIColor.red
        self.refreshControl.addTarget(self, action: #selector(loadData), for: .valueChanged)
        self.collectionView!.addSubview(refreshControl)
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

