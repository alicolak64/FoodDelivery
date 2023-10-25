//
//  HomeScreenViewControllerExtension.swift
//  FoodDelivery
//
//  Created by Ali Çolak on 25.10.2023.
//

import UIKit

extension HomeScreenViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let searchText = searchBar.text {
            presentAlert(title: "Search Clicked", message: searchText + " searched!", buttonTitle: "OK")
            searchBar.text = AppTexts.searchBarPlaceholderText
            searchBar.resignFirstResponder()
        }
    }
    
    func processSearchQuery(_ query: String) {
        updateSearchResults(with: query)
    }
    
    func updateSearchResults(with query: String) {
    }
}

extension HomeScreenViewController {
    @objc func cartButtonTapped() {
        presentAlert(title: "Cart Clicked", message: "Cart button clicked!", buttonTitle: "OK")
    }
    
    @objc func arrowDownButtonTapped() {
        presentAlert(title: "Location Clicked", message: "Arrow Down Button clicked!", buttonTitle: "OK")
    }
}
