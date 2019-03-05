//
//  LentaCell.swift
//  MVVM-Coordinator-template
//
//  Created by Maxim Spiridonov on 03/03/2019.
//  Copyright © 2019 Maxim Spiridonov. All rights reserved.
//


import UIKit
import SkeletonView

class LentaCell: UICollectionViewCell {
    var gradient = SkeletonGradient(baseColor: UIColor.silver)
    
    @IBOutlet weak var timeImage: UIImageView! { didSet { initSkeleton(timeImage) } }
    @IBOutlet weak var likeImage: UIImageView! { didSet { initSkeleton(likeImage) } }
    @IBOutlet weak var chatImage: UIImageView! { didSet { initSkeleton(chatImage) } }
    @IBOutlet weak var recipeNew: UIView! { didSet { initSkeleton(recipeNew) } }
    @IBOutlet weak var recipeTitle: UILabel! { didSet { initSkeleton(recipeTitle) } }
    @IBOutlet weak var recipeAuthor: UILabel! { didSet { initSkeleton(recipeAuthor) } }
    @IBOutlet weak var recipeTime: UILabel! { didSet { initSkeleton(recipeTime) } }
    @IBOutlet weak var recipeLike: UILabel! { didSet { initSkeleton(recipeLike) } }
    @IBOutlet weak var recipeChat: UILabel! { didSet { initSkeleton(recipeChat) } }
    @IBOutlet weak var recipeImage: UIImageView! {
        didSet {
    
            recipeImage.layer.cornerRadius = 10
            recipeImage.clipsToBounds = true
            recipeImage.isSkeletonable = true
            recipeImage.showAnimatedGradientSkeleton()
        }
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }
    
    private func initSkeleton(_ view: UIView) {
        view.isSkeletonable = true
        view.showAnimatedGradientSkeleton(usingGradient: gradient)        
    }
    
    private func setupUI () {
        self.contentView.layer.cornerRadius = 4.0
        self.contentView.layer.borderWidth = 1.0
        self.contentView.layer.borderColor = UIColor.clear.cgColor
        self.contentView.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        self.layer.shadowRadius = 4.0
        self.layer.shadowOpacity = 1.0
        self.layer.cornerRadius = 10
        self.layer.masksToBounds = false
        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.contentView.layer.cornerRadius).cgPath
    }
}
