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
        showAlert(title: "Open Addresses Clicked", message: "Open Addresses Button clicked!", buttonTitle: "OK")
    }
    @objc func viewAllButtonTapped(sender: UIButton) {
        if sender.tag == 1 {
            showAlert(title: AppTexts.popularRestaurantsTitleText + " Clicked", message: AppTexts.popularRestaurantsTitleText + " Button clicked!", buttonTitle: "OK")
        } else if sender.tag == 2 {
            showAlert(title: AppTexts.mostPopularRestaurantsTitleText + " Clicked", message: AppTexts.mostPopularRestaurantsTitleText + " Button clicked!", buttonTitle: "OK")
        } else if sender.tag == 3 {
            showAlert(title: AppTexts.recentItemsRestaurantsTitleText + " Clicked", message: AppTexts.recentItemsRestaurantsTitleText + " Button clicked!", buttonTitle: "OK")
        }
    }
    
}

extension HomeScreenViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let category = categoryList[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryViewCell.identifier, for: indexPath) as! CategoryViewCell
        cell.configure(with: category)
        return cell
    }
    
    
    
}

extension HomeScreenViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return popularRestaurantList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let restaurant = popularRestaurantList[indexPath.row]
        let cell =  tableView.dequeueReusableCell(withIdentifier: PopularRestaurantViewCell.identifier, for: indexPath) as! PopularRestaurantViewCell
        
        
        if let category = categoryList.first(where: { $0.id == restaurant.categoryId }) {
            cell.configure(with: restaurant, category: category)
        }
                
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.height * 0.4
    }
    
    
}



