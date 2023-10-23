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
        label.text = "Good Morning Akila!"
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.layer.borderColor = UIColor.black.cgColor
        label.textAlignment = .center
        label.textColor = UIColor(hex: "#545557")
        return label
    }()
    
    lazy var cartButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "cart.fill"), for: .normal)
        button.tintColor = UIColor(hex: "#545557")
        button.addTarget(self, action: #selector(cartButtonTapped), for: .touchUpInside)
        return button
    }()
    
    let deliveringToLabel: UILabel = {
        let label = UILabel()
        label.text = "Delivering to"
        label.textColor = UIColor(hex: "#cdcdcd")
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    lazy var currentLocationLabel: UILabel = {
        let label = UILabel()
        label.text = "Current Location"
        label.textColor = UIColor(hex: "#898a8b")
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    lazy var arrowDownButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "chevron.compact.down"), for: .normal)
        button.tintColor = UIColor(hex: "#FB6B10")
        button.addTarget(self, action: #selector(arrowDownButtonTapped), for: .touchUpInside)
        return button
    }()
        
    lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "Search food"
        searchBar.barStyle = .default
        searchBar.searchBarStyle = .minimal
        searchBar.delegate = self
        return searchBar
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        
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
    
    
    
    @objc func cartButtonTapped() {
        presentAlert(title: "Cart Clicked", message: "Cart button clicked!", buttonTitle: "OK")
    }
    
    @objc func arrowDownButtonTapped() {
        presentAlert(title: "Location Clicked", message: "Arrow Down Button clicked!", buttonTitle: "OK")
    }
    
}


extension HomeScreenViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let searchText = searchBar.text {
            presentAlert(title: "Search Clicked", message: searchText + " searched!", buttonTitle: "OK")
            searchBar.text = ""
            searchBar.resignFirstResponder()
        }
    }
    
    func processSearchQuery(_ query: String) {
        updateSearchResults(with: query)
    }
    
    func updateSearchResults(with query: String) {
    }
}




