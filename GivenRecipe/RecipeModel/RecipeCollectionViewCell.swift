//
//  RecipeCollectionViewCell.swift
//  GivenRecipe
//
//  Created by Christian Elijah on 2020-09-03.
//  Copyright © 2020 Christian Elijah. All rights reserved.
//

import UIKit

// Recipe Cell
class RecipeCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet var foodImage: UIImageView!
    @IBOutlet var foodIcons: [UIImageView]!
    @IBOutlet var shadowView: UIView!
    
    // Data Setup
    var data: RecipeData? {
        didSet {
            guard let data = data else { return }
            foodImage.image = data.image
            foodImage.layer.cornerRadius = 20
            shadowView.layer.cornerRadius = 20
            shadowView.layer.shadowOpacity = 0.4
            shadowView.layer.shadowColor = UIColor.black.cgColor
            shadowView.layer.shadowRadius = 6
            shadowView.layer.shadowOffset = .zero
        }
    }
    
    
    // Init CGRect
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(foodImage)
    }
    
    // NSCODER
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
