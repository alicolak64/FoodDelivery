//
//  HomeScreenViewControllerExtension.swift
//  FoodDelivery
//
//  Created by Ali Çolak on 25.10.2023.
//

import UIKit
import RxSwift
import RxCocoa


extension HomeScreenViewController{
    
    func setupBindings() {
        
        viewModel.categories
            .observe(on: MainScheduler.asyncInstance)
            .subscribe { categories in
                self.categoryList = categories
                self.categoryCollectionView.reloadData()
            }
            .disposed(by: disposeBag)
        
        viewModel.categoriesError
            .observe(on: MainScheduler.asyncInstance)
            .subscribe { error in
                print(error)
            }
            .disposed(by: disposeBag)
        
        viewModel.popularRestaurants
            .observe(on: MainScheduler.asyncInstance)
            .subscribe { resturants in
                self.popularRestaurantList = resturants
                self.popularRestaurantsTableView.reloadData()
            }
            .disposed(by: disposeBag)
        
        viewModel.allResturantsError
            .observe(on: MainScheduler.asyncInstance)
            .subscribe { error in
                print(error)
            }
            .disposed(by: disposeBag)
        
        viewModel.mostPopularRestaurants
            .observe(on: MainScheduler.asyncInstance)
            .subscribe { resturants in
                self.mostPopularRestaurantList = resturants
                self.mostPopularCollectionView.reloadData()
            }
            .disposed(by: disposeBag)
        
        viewModel.mostPopularRestaurantsError
            .observe(on: MainScheduler.asyncInstance)
            .subscribe { error in
                print(error)
            }
            .disposed(by: disposeBag)
        
        viewModel.recentlyItemsRestaurants
            .observe(on: MainScheduler.asyncInstance)
            .subscribe { resturants in
                self.recentlyItemsRestaurantList = resturants
                self.recentItemsTableView.reloadData()
            }
            .disposed(by: disposeBag)
        
        viewModel.recentlyItemsRestaurantsError
            .observe(on: MainScheduler.asyncInstance)
            .subscribe { error in
                print(error)
            }
            .disposed(by: disposeBag)
        
        viewModel.loading
            .observe(on: MainScheduler.asyncInstance)
            .subscribe { isLoading in
                if isLoading {
                    self.activityIndicator.startAnimating()
                } else {
                    self.activityIndicator.stopAnimating()
                }
            }
            .disposed(by: disposeBag)
    }
    
}

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
        
        if collectionView.tag == 1 {
            return categoryList.count
        } else if collectionView.tag == 2 {
            return mostPopularRestaurantList.count
        } else {
            return 0
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        if collectionView.tag == 1 {
            
            let category = categoryList[indexPath.row]
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryViewCell.identifier, for: indexPath) as! CategoryViewCell
            cell.configure(with: category)
            
            return cell
            
        } else if collectionView.tag == 2 {
            
            let restaurant = mostPopularRestaurantList[indexPath.row]
            let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: MostPopularViewCell.identifier, for: indexPath) as! MostPopularViewCell
            
            if let category = categoryList.first(where: { $0.id == restaurant.categoryId }) {
                cell.configure(with: restaurant, category: category)
            }
            
            return cell
            
        } else {
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if collectionView.tag == 1 {
            let category = categoryList[indexPath.row]
            viewModel.changeCategory(categoryId: category.id)
        } else if collectionView.tag == 2 {
            let restaurant = mostPopularRestaurantList[indexPath.row]
            showAlert(title: restaurant.name + " Clicked", message: restaurant.description, buttonTitle: "OK")
        }
    }
    
    
    
}

extension HomeScreenViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if tableView.tag == 1 {
            return popularRestaurantList.count
        } else if tableView.tag == 2 {
            return recentlyItemsRestaurantList.count
        } else {
            return 0
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView.tag == 1 {
            
            let restaurant = popularRestaurantList[indexPath.row]
            let cell =  tableView.dequeueReusableCell(withIdentifier: PopularRestaurantViewCell.identifier, for: indexPath) as! PopularRestaurantViewCell
            
            if let category = categoryList.first(where: { $0.id == restaurant.categoryId }) {
                cell.configure(with: restaurant, category: category)
            }
            
            return cell
            
        } else if tableView.tag == 2 {
            
            let restaurant = recentlyItemsRestaurantList[indexPath.row]
            let cell =  tableView.dequeueReusableCell(withIdentifier: RecentItemsViewCell.identifier, for: indexPath) as! RecentItemsViewCell
            
            if let category = categoryList.first(where: { $0.id == restaurant.categoryId }) {
                cell.configure(with: restaurant, category: category)
            }
            
            return cell
            
        } else {
            return UITableViewCell()
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView.tag == 1 {
            return view.frame.height * 0.36
        } else if tableView.tag == 2 {
            return view.frame.height * 0.17
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView.tag == 1 {
            let restaurant = popularRestaurantList[indexPath.row]
            showAlert(title: restaurant.name + " Clicked", message: restaurant.description, buttonTitle: "OK")
        } else if tableView.tag == 2 {
            let restaurant = recentlyItemsRestaurantList[indexPath.row]
            showAlert(title: restaurant.name + " Clicked", message: restaurant.description, buttonTitle: "OK")
        }
    }
    
    
}



