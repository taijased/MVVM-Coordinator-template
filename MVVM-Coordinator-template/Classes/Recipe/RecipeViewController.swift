//
//  RecipeViewController.swift
//  MVVM-Coordinator-template
//
//  Created by Maxim Spiridonov on 03/03/2019.
//  Copyright © 2019 Maxim Spiridonov. All rights reserved.
//

import UIKit

class RecipeViewController: UIViewController, StoryboardInitializable {
    

    var onSelectHidden: (() -> Void)?
    var viewModel: RecipeViewModel!
    
    @IBAction func hiddenRecipeTap(_ sender: Any) {
        onSelectHidden?()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
