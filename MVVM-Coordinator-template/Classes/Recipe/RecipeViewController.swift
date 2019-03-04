//
//  RecipeViewController.swift
//  MVVM-Coordinator-template
//
//  Created by Maxim Spiridonov on 03/03/2019.
//  Copyright © 2019 Maxim Spiridonov. All rights reserved.
//

import UIKit

class RecipeViewController: UIViewController, StoryboardInitializable {
    

    @IBOutlet weak var recipeTitle: UILabel!
    @IBOutlet weak var recipeAuthor: UILabel!
    @IBOutlet weak var recipeTime: UILabel!
    @IBOutlet weak var recipeLike: UILabel!
    @IBOutlet weak var recipeChat: UILabel!
    
    
    var onSelectHidden: (() -> Void)?
    var onSubscribeMasterClass: (() -> Void)?
    var viewModel: RecipeViewModel!
    
    @IBOutlet weak var btnMasterClass: UIButton! {
        didSet {
            btnMasterClass.layer.cornerRadius = 30
            btnMasterClass.clipsToBounds = true
        }
    }
    
    
    @IBAction func subscribeMasterClass(_ sender: UIButton) {
        onSubscribeMasterClass?()
    }
    
    @IBAction func hiddenRecipeTap(_ sender: Any) {
        onSelectHidden?()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
