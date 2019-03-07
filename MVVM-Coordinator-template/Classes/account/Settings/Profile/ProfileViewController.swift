//
//  ProfileViewController.swift
//  MVVM-Coordinator-template
//
//  Created by Maxim Spiridonov on 06/03/2019.
//  Copyright © 2019 Maxim Spiridonov. All rights reserved.
//

import UIKit
import RxSwift



class ProfileViewController: UIViewController, StoryboardInitializable {
    
    let disposeBag = DisposeBag()
    var viewModel: ProfileViewModel!
    
    @IBOutlet weak var cancelBtn: UIBarButtonItem!{
        didSet {
            cancelBtn.tintColor = UIColor.black
        }
    }
    @IBOutlet weak var saveSettingsBtn: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupBindings()
        
    }
    
    
    private func setupUI() {
        
    }
    
    private func setupBindings() {
        cancelBtn.rx.tap
            .bind(to: viewModel.cancel)
            .disposed(by: disposeBag)
        saveSettingsBtn.rx.tap
            .bind(to: viewModel.save)
            .disposed(by: disposeBag)
    }

}
