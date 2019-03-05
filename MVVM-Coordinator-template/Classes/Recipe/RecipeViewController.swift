//
//  RecipeViewController.swift
//  MVVM-Coordinator-template
//
//  Created by Maxim Spiridonov on 03/03/2019.
//  Copyright © 2019 Maxim Spiridonov. All rights reserved.
//

import UIKit
import SkeletonView
import Kingfisher

class RecipeViewController: UIViewController, StoryboardInitializable {
    
    var gradient = SkeletonGradient(baseColor: UIColor.silver)
    
    @IBOutlet weak var btnSubscribeMock: UIButton!
    @IBOutlet weak var recipeDescription: UITextView! { didSet { initSkeleton(recipeDescription) } }
    @IBOutlet weak var recipeImage: UIImageView! {
        didSet {
            recipeImage.isSkeletonable = true
            recipeImage.showAnimatedGradientSkeleton()
        }
    }
    @IBOutlet weak var likeImageBtn: UIButton! { didSet { initSkeleton(likeImageBtn) } }
    @IBOutlet weak var chatImageBtn: UIButton! { didSet { initSkeleton(chatImageBtn) } }
    @IBOutlet weak var timeImage: UIImageView! { didSet { initSkeleton(timeImage) } }
    @IBOutlet weak var recipeTitle: UILabel! { didSet { initSkeleton(recipeTitle) } }
    @IBOutlet weak var recipeAuthor: UILabel! { didSet { initSkeleton(recipeAuthor) } }
    @IBOutlet weak var recipeTime: UILabel! { didSet { initSkeleton(recipeTime) } }
    @IBOutlet weak var recipeLike: UILabel! { didSet { initSkeleton(recipeLike) } }
    @IBOutlet weak var recipeChat: UILabel! { didSet { initSkeleton(recipeChat) } }
    
    
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
        setupUI()
    }
    
    func setupUI() {
        
        DispatchQueue.global().async {
            let url = URL(string: self.viewModel.recipe.imageUrl)
            DispatchQueue.main.async {
                self.view.hideSkeleton()
                
                self.recipeImage.kf.setImage(with: url)
                self.recipeTitle.text = self.viewModel.recipe.title
                self.recipeAuthor.text = self.viewModel.recipe.author
                self.recipeTime.text = String(self.viewModel.recipe.timing) + " минут"
                self.recipeLike.text = String(self.viewModel.recipe.likeCount)
                self.recipeChat.text = String(self.viewModel.recipe.likeCount)
                
            }
        }
        
    }
    
    
    private func initSkeleton(_ view: UIView) {
        view.isSkeletonable = true
        view.showAnimatedGradientSkeleton(usingGradient: gradient)
    }
}
