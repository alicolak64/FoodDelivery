//
//  categoryCollectionViewCell.swift
//  FoodDelivery
//
//  Created by Ali Çolak on 26.10.2023.
//

import UIKit
import Kingfisher

class CategoryViewCell: UICollectionViewCell {
    
    static let identifier = "CategoryViewCell"
    
    private let categoryImageView : UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.masksToBounds = true
        image.layer.cornerRadius = 15 
        return image
    }()
    
    private let categoryNameLabel : UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = AppFonts.cardText
        label.textColor = AppColors.primaryFontColor
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
    
    func configure(with category : Category) {
        self.categoryImageView.kf.setImage(with: URL(string: category.image))
        self.categoryNameLabel.text = category.name
    }
    
    
    func addCellComponents(){
        contentView.addSubview(categoryImageView)
        contentView.addSubview(categoryNameLabel)
    }
    
    
    func setCellLayouts(){
        NSLayoutConstraint.activate([
            categoryImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            categoryImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            categoryImageView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            categoryImageView.heightAnchor.constraint(equalToConstant: contentView.frame.height * 0.7),
            
            
            categoryNameLabel.topAnchor.constraint(equalTo: categoryImageView.bottomAnchor,constant: 10),
            categoryNameLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            categoryNameLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor)
        ])
    }
    
}
