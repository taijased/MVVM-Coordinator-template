//
//  CategoryListCell.swift
//  MVVM-Coordinator-template
//
//  Created by Maxim Spiridonov on 03/03/2019.
//  Copyright © 2019 Maxim Spiridonov. All rights reserved.
//

import UIKit
import SkeletonView

class CategoryListCell: UICollectionViewCell {
    //    override var isSelected: Bool { didSet{ selectedCategory() } }
    
    var gradient = SkeletonGradient(baseColor: UIColor.silver)
    
    @IBOutlet weak var categoryTitle: UILabel! { didSet { initSkeleton(categoryTitle) } }
    
    @IBOutlet weak var categoryImage: UIImageView!  { didSet { initSkeleton(categoryImage) } }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

//        временное решение чисто для отображения  реализация должна быть во viewModel
        
    }

    private func initSkeleton(_ view: UIView) {
        view.isSkeletonable = true
        view.showAnimatedGradientSkeleton(usingGradient: gradient)
    }

}
