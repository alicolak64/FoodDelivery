//
//  MostPopularViewCell.swift
//  FoodDelivery
//
//  Created by Ali Çolak on 1.11.2023.
//

import UIKit
import Kingfisher

class MostPopularViewCell: UICollectionViewCell {
    
    static let identifier = "MostPopularViewCell"
    
    private let restaurentImageView : UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.masksToBounds = true
        image.layer.cornerRadius = 15
        return image
    }()
    
    private let restaurentNameLabel : UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = AppFonts.titleCardText
        label.textColor = AppColors.primaryFontColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let restaurantRatingIcon: UIImageView = {
        let image = AppIcons.starIcon
        let imageView = UIImageView(image: image)
        imageView.tintColor = AppColors.mainColor
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let restaurentRatingLabel : UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = AppFonts.placeholderTitleFont
        label.textColor = AppColors.mainColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let restaurentTypeLabel : UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = AppFonts.placeholderFont
        label.textColor = AppColors.placeholderFontColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let restaurantCategoryLabel : UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = AppFonts.placeholderFont
        label.textColor = AppColors.placeholderFontColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    override init(frame : CGRect) {
        super.init(frame: frame)
        
        addCellComponents()
        setCellLayouts()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with restaurant: Restaurant, category: Category) {
        self.restaurentImageView.kf.setImage(with: URL(string: restaurant.image))
        self.restaurentNameLabel.text = restaurant.name
        self.restaurentRatingLabel.text = String(restaurant.rating)
        self.restaurentTypeLabel.text = "Cafe"
        self.restaurantCategoryLabel.text = category.name
    }
    
    
    func addCellComponents(){
        contentView.addSubview(restaurentImageView)
        
        contentView.addSubview(restaurentNameLabel)
        
        contentView.addSubview(restaurentTypeLabel)
        contentView.addSubview(restaurantCategoryLabel)
        contentView.addSubview(restaurantRatingIcon)
        contentView.addSubview(restaurentRatingLabel)
    }
    
    
    func setCellLayouts(){
        NSLayoutConstraint.activate([
            restaurentImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            restaurentImageView.heightAnchor.constraint(equalToConstant: contentView.frame.height * 0.65),
            restaurentImageView.widthAnchor.constraint(equalToConstant: contentView.frame.width),

            
            restaurentNameLabel.topAnchor.constraint(equalTo: restaurentImageView.bottomAnchor,constant: 15),
            restaurentNameLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor , constant: 10),
            
            restaurentTypeLabel.topAnchor.constraint(equalTo: restaurentNameLabel.bottomAnchor,constant: 10),
            restaurentTypeLabel.leftAnchor.constraint(equalTo: restaurentNameLabel.leftAnchor),
            
            restaurantCategoryLabel.topAnchor.constraint(equalTo: restaurentNameLabel.bottomAnchor,constant: 10),
            restaurantCategoryLabel.leftAnchor.constraint(equalTo: restaurentTypeLabel.rightAnchor,constant: 20),
            
            restaurantRatingIcon.topAnchor.constraint(equalTo: restaurentNameLabel.bottomAnchor,constant: 10),
            restaurantRatingIcon.leftAnchor.constraint(equalTo: restaurantCategoryLabel.rightAnchor,constant: 20),
            restaurantRatingIcon.heightAnchor.constraint(equalToConstant: 15),
            restaurantRatingIcon.widthAnchor.constraint(equalToConstant: 15),
            
            restaurentRatingLabel.topAnchor.constraint(equalTo: restaurentNameLabel.bottomAnchor,constant: 10),
            restaurentRatingLabel.leftAnchor.constraint(equalTo: restaurantRatingIcon.rightAnchor,constant: 3),

            
            
        ])
    }

    
}
