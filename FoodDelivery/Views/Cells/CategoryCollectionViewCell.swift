//
//  categoryCollectionViewCell.swift
//  FoodDelivery
//
//  Created by Ali Çolak on 26.10.2023.
//

import UIKit
import Kingfisher

class CategoryCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CategoryCollectionViewCell"
    
    private lazy var imageView : UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.masksToBounds = true
        return image
    }()
    
    private lazy var nameLabel : UILabel = {
        let label = UILabel()
        label.font = AppFonts.cardText
        label.textColor = AppColors.primaryFontColor
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame : CGRect) {
        
        super.init(frame: frame)
        
        contentView.addSubview(imageView)
        contentView.addSubview(nameLabel)
        
        setLayouts()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    func configure(with category : Category) {
        
        DispatchQueue.main.async {
            self.imageView.kf.setImage(with: URL(string: category.image))
            self.nameLabel.text = category.name
        }
        
    }
    
    
    func setLayouts(){
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            imageView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            imageView.heightAnchor.constraint(equalToConstant: contentView.frame.height * 0.7),
            
            
            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor,constant: 10),
            nameLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            nameLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor)
        ])
    }
    
}
