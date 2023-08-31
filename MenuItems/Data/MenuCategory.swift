//
//  Filter.swift
//  MenuItems
//
//  Created by Bruce Burgess on 8/29/23.
//

import Foundation

// MARK: - Enums

/// This is the is the category object of the menus. There are currently only 3 of them. Food, Drink, and Dessert
///  This is part of Task 2 for the assignment and for Task 3 for the assignment
enum MenuCategory : String, CaseIterable, Identifiable {
    var id: String { self.rawValue }
    case food = "Food"
    case drink = "Drink"
    case dessert = "Dessert"
}

/// This is the sort menu object. This is use for sorting the menu items either by alphabatic, price, or orderCount
/// This is part of Task 2 for the assignment
enum SortMenu: String, CaseIterable, Identifiable {
    var id: String { self.rawValue }
    case mostPopular = "Most Popular"
    case price = "Price $-$$$"
    case alphabetic = "A-Z"
}

// MARK: - Structs
/// This is the structure that is used to create a menu item category. This is used to cread the different instances of objects for the different menu categories
struct MenuItemCategory {
    let category: String
    var menuItems : [MenuItem]
}

// MARK: - View Model

/// This class is used to hold on to the data and keep track of the state of the data.
/// This is for Task 6 for the assignment
class MenuViewViewModel : ObservableObject {
    @Published var selectedMenuCategories: Set<MenuCategory> = [.food, .drink, .dessert]
    @Published var selectedSortOptions: SortMenu = .alphabetic
    
    private var foodMenuItems : MenuItemCategory
    private var drinkMenuItems : MenuItemCategory
    private var desertMenuItems : MenuItemCategory
    @Published var menuItemCategories : [MenuItemCategory]
    
    init(foodMenuItems: MenuItemCategory, drinkMenuItems: MenuItemCategory, desertMenuItems: MenuItemCategory) {
        self.foodMenuItems = foodMenuItems
        self.drinkMenuItems = drinkMenuItems
        self.desertMenuItems = desertMenuItems
        self.menuItemCategories = [foodMenuItems, drinkMenuItems, desertMenuItems]
        handleSortOrFilter()
    }
    
    /// This function is called from the view so it can sort the menu items and filter out hte categories based on the options menu
    func handleSortOrFilter() {
        sortMenuItems()
        filterMenu()
    }
    
    /// This fuction sorts the menu items of each category depending on what the selectedSortOptions is selected to.
    func sortMenuItems() {
        var foodItems : [MenuItem]
        var drinkItems : [MenuItem]
        var desertItems : [MenuItem]
        switch(selectedSortOptions) {
        case .alphabetic:
            foodItems = foodMenuItems.menuItems.sorted { $0.title < $1.title }
            drinkItems = drinkMenuItems.menuItems.sorted { $0.title < $1.title }
            desertItems = desertMenuItems.menuItems.sorted { $0.title < $1.title }
        case .price:
            foodItems = foodMenuItems.menuItems.sorted { $0.price < $1.price }
            drinkItems = drinkMenuItems.menuItems.sorted { $0.price < $1.price }
            desertItems = desertMenuItems.menuItems.sorted { $0.price < $1.price }
        case .mostPopular:
            foodItems = foodMenuItems.menuItems.sorted { $0.orderCount > $1.orderCount }
            drinkItems = drinkMenuItems.menuItems.sorted { $0.orderCount > $1.orderCount }
            desertItems = desertMenuItems.menuItems.sorted { $0.orderCount > $1.orderCount }
        }
        foodMenuItems.menuItems = foodItems
        drinkMenuItems.menuItems = drinkItems
        desertMenuItems.menuItems = desertItems
    }
    
    /// This function filters the menu category items out based on the the selectedMenuCategories set holds. It maintains the order of Food, Drink, Dessert.
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


extension MenuViewViewModel {
    var testableFoodMenuItems: MenuItemCategory { foodMenuItems }
    var testableDrinkMenuItems: MenuItemCategory { drinkMenuItems }
    var testableDesertMenuItems: MenuItemCategory { desertMenuItems }
}

extension MenuItem: Equatable {
    static func == (lhs: MenuItem, rhs: MenuItem) -> Bool {
        return lhs.id == rhs.id &&
            lhs.title == rhs.title &&
            lhs.ingredients == rhs.ingredients &&
            lhs.price == rhs.price &&
            lhs.menuCategory == rhs.menuCategory &&
            lhs.orderCount == rhs.orderCount
    }
}
