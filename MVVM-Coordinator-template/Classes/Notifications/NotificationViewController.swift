//
//  NotificationViewController.swift
//  MVVM-Coordinator-template
//
//  Created by Maxim Spiridonov on 04/03/2019.
//  Copyright © 2019 Maxim Spiridonov. All rights reserved.
//
import UIKit
import RxSwift
import RxCocoa



class NotificationViewController: UIViewController, StoryboardInitializable {
    let disposeBag = DisposeBag()
    var viewModel: NotificationViewModel!
    var cellIdentifier = "notificationCell"
    
    
    private let refreshControl = UIRefreshControl()
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBindings()
        setupNavigationBar()
        setupRefresher()
        
        setupNotificationBadge()
        
    }
    func setupNotificationBadge() {
        self.tabBarItem.badgeValue = "4"
    }
   
    private func setupBindings() {
        viewModel.notification
            .observeOn(MainScheduler.instance)
            .do(onNext: { [weak self] _ in self?.refreshControl.endRefreshing() })
            .bind(to: collectionView.rx.items(cellIdentifier: self.cellIdentifier, cellType: NotificationCell.self)) { (_, notification, cell) in
                self.setupNotificationCell(cell, notification)
            }
            .disposed(by: disposeBag)
        collectionView.rx.modelSelected(Notification.self)
            .bind(to: viewModel.selectNotification)
            .disposed(by: disposeBag)
    }
    
    private func setupNotificationCell(_ cell: NotificationCell, _ notification: Notification) {
        cell.notificationTime.text = notification.time
        cell.notificationTitle.text = notification.title
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
    @objc func loadData() {
        viewModel.fetchCategory()
        stopRefresher()
    }
    
    func stopRefresher() {
        self.refreshControl.endRefreshing()
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

