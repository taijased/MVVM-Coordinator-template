//
//  AccountViewController.swift
//  MVVM-Coordinator-template
//
//  Created by Maxim Spiridonov on 04/03/2019.
//  Copyright © 2019 Maxim Spiridonov. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa



class AccountViewController: UIViewController, StoryboardInitializable {
    let disposeBag = DisposeBag()
    var viewModel: AccountViewModel!

    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var settingBtn: UIButton!
    @IBOutlet weak var userLogin: UILabel!
    @IBOutlet weak var userFollowers: UIButton!
    @IBOutlet weak var userFollowing: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBindings()
        setupUI()
        setupNavigationBar()
    }
    
    
    private func setupBindings() {
        
        
        
        
        settingBtn.rx.tap
            .bind(to: viewModel.setting)
            .disposed(by: disposeBag)
    }
    private func setupUI() {
        self.userName.text = viewModel.user.name
        self.userLogin.text = viewModel.user.login
        self.userFollowers.titleLabel?.text = String(viewModel.user.followers)
        self.userFollowing.titleLabel?.text = String(viewModel.user.following)
    }
    

    private func setupNavigationBar() {
       
        //        убрать линию нижнюю
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()

        //        хуйня чтобы загрузить нашу стрелку
        self.navigationController?.navigationBar.backIndicatorImage = UIImage(named: "back")

        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "back")

        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItem.Style.plain, target: nil, action: nil)

        self.navigationController?.navigationBar.tintColor = UIColor.black
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

