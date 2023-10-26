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
            showAlert(title: "Search Clicked", message: searchText + " searched!", buttonTitle: "OK")
            searchBar.text = ""
            searchBar.placeholder = AppTexts.searchBarPlaceholderText
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
        showAlert(title: "Cart Clicked", message: "Cart button clicked!", buttonTitle: "OK")
    }
    
    @objc func arrowDownButtonTapped() {
        showAlert(title: "Location Clicked", message: "Arrow Down Button clicked!", buttonTitle: "OK")
    }
}

extension HomeScreenViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(categoryList.count)
        print("****")
        return categoryList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let category = categoryList[indexPath.row]
        print(category)
        print("*******")
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as! CategoryCollectionViewCell
        cell.configure(with: category)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 70, height: 100)
    }
    
}


