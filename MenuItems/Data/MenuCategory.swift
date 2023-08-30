//
//  Filter.swift
//  MenuItems
//
//  Created by Bruce Burgess on 8/29/23.
//

import Foundation

enum MenuCategory : String, CaseIterable, Identifiable {
    var id: String { self.rawValue }
    case food = "Food"
    case drink = "Drink"
    case dessert = "Dessert"
}

enum SortMenu: String, CaseIterable, Identifiable {
    var id: String { self.rawValue }
    case mostPopular = "Most Popular"
    case price = "Price $-$$$"
    case alphabetic = "A-Z"
}

struct MenuItemCategory {
    let category: String
    let menuItems : [MenuItem]
}


class MenuViewViewModel : ObservableObject {
    @Published var selectedMenuCategories: Set<MenuCategory> = [.food, .drink, .dessert]
    @Published var selectedSortOptions: SortMenu? = nil
    
    private let foodMenuItems : MenuItemCategory
    private let drinkMenuItems : MenuItemCategory
    private let desertMenuItems : MenuItemCategory
    @Published var menuItemCategories : [MenuItemCategory]
    
    init(foodMenuItems: MenuItemCategory, drinkMenuItems: MenuItemCategory, desertMenuItems: MenuItemCategory) {
        self.foodMenuItems = foodMenuItems
        self.drinkMenuItems = drinkMenuItems
        self.desertMenuItems = desertMenuItems
        self.menuItemCategories = [foodMenuItems, drinkMenuItems, desertMenuItems]
    }
    

    func handleSortOrFilter() {
        sortMenuItems()
        filterMenu()
//        if let sortMenu = sortMenu {
//            sortMenuItems(sortMenu)
//        }
//        if let category = category {
//            filterMenu()
//        }
    }
    
    private func sortMenuItems() {

        print(selectedSortOptions)
    }
    
    func filterMenu() {
        var filteredCategories = [MenuItemCategory]()
        
        if selectedMenuCategories.contains(.food) {
            filteredCategories.append(foodMenuItems)
        }
        if selectedMenuCategories.contains(.drink) {
            filteredCategories.append(drinkMenuItems)
        }
        if selectedMenuCategories.contains(.dessert) {
            filteredCategories.append(desertMenuItems)
        }
        
        menuItemCategories = filteredCategories
       
    }



}



