//
//  AppTabs.swift
//  FoodDelivery
//
//  Created by Ali Çolak on 25.10.2023.
//

import UIKit


struct Tab {
    let name : String
    let icon : UIImage
}

struct AppTabs {
    static let tab1 = Tab(name: AppTexts.tab1Text, icon: AppIcons.tab1Icon!)
    static let tab2 = Tab(name: AppTexts.tab2Text, icon: AppIcons.tab2Icon!)
    static let tab3 = Tab(name: AppTexts.tab3Text, icon: AppIcons.tab3Icon!)
    static let tab4 = Tab(name: AppTexts.tab4Text, icon: AppIcons.tab4Icon!)
    static let tab5 = Tab(name: AppTexts.tab5Text, icon: AppIcons.tab5Icon!)
}



