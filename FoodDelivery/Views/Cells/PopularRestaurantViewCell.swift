//
//  PopularRestaurantViewCell.swift
//  FoodDelivery
//
//  Created by Ali Çolak on 26.10.2023.
//

import UIKit

class PopularRestaurantViewCell: UITableViewCell {
    
    static let identifier = "PopularRestaurantViewCell"
    
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
    
    private let restaurentRatingCountLabel : UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = AppFonts.placeholderFont
        label.textColor = AppColors.placeholderFontColor
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
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = AppColors.backgroundColor
        
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
        self.restaurentRatingCountLabel.text = "(\(String(restaurant.ratingCount)) ratings)"
        self.restaurentTypeLabel.text = "Cafe"
        self.restaurantCategoryLabel.text = category.name
    }
    
    func addCellComponents(){
        
        contentView.addSubview(restaurentImageView)
        contentView.addSubview(restaurentNameLabel)
        
        contentView.addSubview(restaurantRatingIcon)
        contentView.addSubview(restaurentRatingLabel)
        contentView.addSubview(restaurentRatingCountLabel)
        contentView.addSubview(restaurentTypeLabel)
        contentView.addSubview(restaurantCategoryLabel)
        
    }
    
    
    func setCellLayouts(){
        
        NSLayoutConstraint.activate([
            restaurentImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            restaurentImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            restaurentImageView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            restaurentImageView.heightAnchor.constraint(equalToConstant: contentView.frame.height * 5),

            
            restaurentNameLabel.topAnchor.constraint(equalTo: restaurentImageView.bottomAnchor,constant: 15),
            restaurentNameLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor , constant: 10),
            
            restaurantRatingIcon.topAnchor.constraint(equalTo: restaurentNameLabel.bottomAnchor,constant: 10),
            restaurantRatingIcon.leftAnchor.constraint(equalTo: restaurentNameLabel.leftAnchor),
            restaurantRatingIcon.heightAnchor.constraint(equalToConstant: 17),
            
            restaurentRatingLabel.topAnchor.constraint(equalTo: restaurentNameLabel.bottomAnchor,constant: 10),
            restaurentRatingLabel.leftAnchor.constraint(equalTo: restaurantRatingIcon.rightAnchor,constant: 3),
            
            restaurentRatingCountLabel.topAnchor.constraint(equalTo: restaurentNameLabel.bottomAnchor,constant: 10),
            restaurentRatingCountLabel.leftAnchor.constraint(equalTo: restaurentRatingLabel.rightAnchor,constant: 3),
            
            restaurentTypeLabel.topAnchor.constraint(equalTo: restaurentNameLabel.bottomAnchor,constant: 10),
            restaurentTypeLabel.leftAnchor.constraint(equalTo: restaurentRatingCountLabel.rightAnchor,constant: 5),
            
            restaurantCategoryLabel.topAnchor.constraint(equalTo: restaurentNameLabel.bottomAnchor,constant: 10),
            restaurantCategoryLabel.leftAnchor.constraint(equalTo: restaurentTypeLabel.rightAnchor,constant: 10),

        ])
        
    }
    
}
