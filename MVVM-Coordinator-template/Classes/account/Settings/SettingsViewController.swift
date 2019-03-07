//
//  SettingsViewController.swift
//  MVVM-Coordinator-template
//
//  Created by Maxim Spiridonov on 06/03/2019.
//  Copyright © 2019 Maxim Spiridonov. All rights reserved.
//

import UIKit
import RxSwift



class SettingsViewController: UIViewController, StoryboardInitializable {
    let disposeBag = DisposeBag()
    var viewModel: SettingsViewModel!
    var cellIdentifier = "settingsCell"
    

    @IBOutlet weak var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupBindings()
       
        setupNavigationBar()
    }
    
    
    private func setupUI() {
        self.title = "Настройки"
    }
    
    private func setupBindings() {
        
        viewModel.category
            .observeOn(MainScheduler.instance)
            .bind(to: collectionView.rx.items(cellIdentifier: self.cellIdentifier, cellType: SettingsCell.self)) { (_, category, cell) in
                self.setupSettingCell(cell, category)
            }
            .disposed(by: disposeBag)
        collectionView.rx.modelSelected(SettingCategory.self)
            .bind(to: viewModel.selectCategory)
            .disposed(by: disposeBag)
//        cancelBtn.rx.tap
//            .bind(to: viewModel.cancel)
//            .disposed(by: disposeBag)
    }
    private func setupSettingCell(_ cell: SettingsCell, _ category: SettingCategory) {
        cell.settingTitle.text = category.title
    }
    
    
    func setupNavigationBar() {
        //        убрать линию нижнюю
        //        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
//        self.navigationController?.navigationBar.shadowImage = UIImage()
//
//
//        //        хуйня чтобы загрузить нашу стрелку
//        self.navigationController?.navigationBar.backIndicatorImage = UIImage(named: "back")
//
//        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "back")
//
//        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItem.Style.plain, target: nil, action: nil)
//
//        self.navigationController?.navigationBar.tintColor = UIColor.black
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

