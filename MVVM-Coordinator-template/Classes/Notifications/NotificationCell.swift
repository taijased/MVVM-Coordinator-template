//
//  NotificationCell.swift
//  MVVM-Coordinator-template
//
//  Created by Maxim Spiridonov on 04/03/2019.
//  Copyright © 2019 Maxim Spiridonov. All rights reserved.
//
import UIKit

class NotificationCell: UICollectionViewCell {
//    override var isSelected: Bool { didSet{ selectedCategory() } }
    
    
    @IBOutlet weak var notificationTitle: UILabel!
    @IBOutlet weak var notificationTime: UILabel!
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }
    
    func setupUI () {
        self.contentView.layer.cornerRadius = 4.0
        self.contentView.layer.borderWidth = 1.0
        self.contentView.layer.borderColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        self.contentView.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        self.contentView.layer.masksToBounds = false
        self.layer.shadowColor = UIColor(red: 0.7, green: 0.7, blue: 0.78, alpha: 0.5).cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 10)
        self.layer.shadowRadius = 40
        self.layer.shadowOpacity = 1.0
        self.layer.cornerRadius = 10
        self.layer.masksToBounds = false
        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.contentView.layer.cornerRadius).cgPath
    }
}

