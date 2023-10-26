//
//  HomeScreenViewController.swift
//  FoodDelivery
//
//  Created by Ali Çolak on 23.10.2023.
//

import UIKit
import RxSwift
import RxCocoa

class HomeScreenViewController: UIViewController {
    
    var categoryList = [Category]()
    var popularRestaurantList = [Restaurant]()
    var mostPopularRestaurantList = [Restaurant]()
    var recentlyItemsRestaurantList = [Restaurant]()
    
    let disposeBag = DisposeBag()
    
    let viewModel = HomeScreenViewModel()
    
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
    
    lazy var categoryCollectionView : UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 10
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 200, height: 150)
        
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        collectionView.isScrollEnabled = true
        collectionView.isUserInteractionEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        
        
        return collectionView
        
    }()
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.backgroundColor = AppColors.backgroundColor
        
        setupBindings()
        
        viewModel.requestAllData()
        
        addGreetingStack()
        
        addLocationStack()
        
        addSearchBar()
        
        self.view.layoutIfNeeded()
                
        categoryCollectionView.dataSource = self
        categoryCollectionView.delegate = self

        categoryCollectionView.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
        

        view.addSubview(categoryCollectionView)
        
        
    }
    
    func setupBindings() {
        
        viewModel.categories
            .observe(on: MainScheduler.asyncInstance)
            .subscribe { categories in
                self.categoryList = categories
                DispatchQueue.main.async {
                    self.view.layoutIfNeeded()
                    self.categoryCollectionView.reloadData()
                }
    
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
                //self.tableView.reloadData()
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
                //self.tableView.reloadData()
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
                //self.tableView.reloadData()
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
                    print("Open Animated")
                } else {
                    print("Close Animated")
                    
                }
            }
            .disposed(by: disposeBag)
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







