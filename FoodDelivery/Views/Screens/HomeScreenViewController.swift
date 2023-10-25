//
//  HomeScreenViewController.swift
//  FoodDelivery
//
//  Created by Ali Çolak on 23.10.2023.
//

import UIKit

class HomeScreenViewController: UIViewController {
    
    let greetingLabel: UILabel = {
        let label = UILabel()
        label.text = AppTexts.greetingText
        label.font = AppFonts.primaryFont
        label.layer.borderColor = UIColor.black.cgColor
        label.textAlignment = .center
        label.textColor = AppColors.primaryFontColor
        return label
    }()
    
    lazy var cartButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(AppIcons.cartIcon, for: .normal)
        button.tintColor = AppColors.primaryFontColor
        button.addTarget(self, action: #selector(cartButtonTapped), for: .touchUpInside)
        return button
    }()
    
    let deliveringToLabel: UILabel = {
        let label = UILabel()
        label.text = AppTexts.delivreingToText
        label.textColor = AppColors.placeholderFontColor
        label.font = AppFonts.placeholderFont
        return label
    }()
    
    lazy var currentLocationLabel: UILabel = {
        let label = UILabel()
        label.text = AppTexts.locationText
        label.textColor = AppColors.secondaryFontColor
        label.font = AppFonts.secondaryFont
        return label
    }()
    
    lazy var arrowDownButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(AppIcons.arrowDownIcon, for: .normal)
        button.tintColor = AppColors.mainColor
        button.addTarget(self, action: #selector(arrowDownButtonTapped), for: .touchUpInside)
        return button
    }()
        
    lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = AppTexts.searchBarPlaceholderText
        searchBar.barStyle = .default
        searchBar.searchBarStyle = .minimal
        searchBar.delegate = self
        return searchBar
    }()
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.backgroundColor = AppColors.backgroundColor
        
        addGreetingStack()
        
        addLocationStack()
        
        addSearchBar()
        
    }
    
    
    func addGreetingStack() {
        let stackView = UIStackView(arrangedSubviews: [greetingLabel, cartButton])
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        
        view.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
    }
    
    
    func addLocationStack() {
        let horizontalStackView = UIStackView(arrangedSubviews: [currentLocationLabel, arrowDownButton])
        horizontalStackView.axis = .horizontal
        horizontalStackView.alignment = .center
        horizontalStackView.spacing = 20
        
        let spacerView = UIView()
        spacerView.backgroundColor = .clear
        spacerView.heightAnchor.constraint(equalToConstant: 10).isActive = true
        
        let verticalStackView = UIStackView(arrangedSubviews: [spacerView,deliveringToLabel, horizontalStackView])
        verticalStackView.axis = .vertical
        verticalStackView.alignment = .leading
        verticalStackView.spacing = 5
        
        view.addSubview(verticalStackView)
        
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            verticalStackView.topAnchor.constraint(equalTo: greetingLabel.bottomAnchor, constant: 20),
            verticalStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            arrowDownButton.widthAnchor.constraint(equalToConstant: 18),
            arrowDownButton.heightAnchor.constraint(equalToConstant: 18),
        ])
    }
    
    func addSearchBar() {
        
        let spacerView = UIView()
        spacerView.backgroundColor = .clear
        spacerView.heightAnchor.constraint(equalToConstant: 10).isActive = true
        
        let stackView = UIStackView(arrangedSubviews: [spacerView,searchBar])
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = 5
        
        view.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: currentLocationLabel.bottomAnchor, constant: 20),
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
        ])
    }
    
}







