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


class MenuViewViewModel {
    let foodMenuItems : [MenuItemCategory]
    let drinkMenuItems : [MenuItemCategory]
    let desertMenuItems : [MenuItemCategory]
    
    init(foodMenuItems: [MenuItemCategory], drinkMenuItems: [MenuItemCategory], desertMenuItems: [MenuItemCategory]) {
        self.foodMenuItems = foodMenuItems
        self.drinkMenuItems = drinkMenuItems
        self.desertMenuItems = desertMenuItems
    }
    
}

// Mock Data
//let foodItems = [MenuItem(title: "Food 1", ingredients: [.broccoli, .carrot, .pasta]), MenuItem(title: "Food 2", ingredients: [.tomatoSauce, .pasta]), MenuItem(title: "Food 3", ingredients: [.spinach, .tomatoSauce, .pasta, .broccoli]), MenuItem(title: "Food 4", ingredients: [.broccoli, .carrot, .pasta, .spinach, .tomatoSauce]), MenuItem(title: "Food 5", ingredients: [.broccoli, .carrot, .pasta, .spinach, .tomatoSauce]), MenuItem(title: "Food 6", ingredients: [.broccoli, .carrot, .pasta, .spinach, .tomatoSauce]), MenuItem(title: "Food 7", ingredients: [.broccoli, .carrot, .pasta, .spinach, .tomatoSauce]), MenuItem(title: "Food 8", ingredients: [.broccoli, .carrot, .pasta, .spinach, .tomatoSauce]), MenuItem(title: "Food 9", ingredients: [.broccoli, .carrot, .pasta, .spinach, .tomatoSauce]), MenuItem(title: "Food 10", ingredients: [.broccoli, .carrot, .pasta, .spinach, .tomatoSauce]), MenuItem(title: "Food 11", ingredients: [.broccoli, .carrot, .pasta, .spinach, .tomatoSauce]), MenuItem(title: "Food 12", ingredients: [.broccoli, .carrot, .pasta, .spinach, .tomatoSauce])]
//let drinkItems = [MenuItem(title: "Drink 1", ingredients: [.tomatoSauce]), MenuItem(title: "Drink 2",  ingredients: [.broccoli]), MenuItem(title: "Drink 3",  ingredients: [.carrot]), MenuItem(title: "Drink 4",  ingredients: [.spinach]), MenuItem(title: "Drink 5", ingredients: [.tomatoSauce, .carrot]), MenuItem(title: "Drink 6",  ingredients: [.tomatoSauce, .spinach]), MenuItem(title: "Drink 7",  ingredients: [.tomatoSauce, .broccoli]), MenuItem(title: "Drink 8",  ingredients: [.tomatoSauce, .broccoli, .spinach])]
//let desertItems = [MenuItem(title: "Dessert 1",  ingredients: []), MenuItem(title: "Dessert 2",  ingredients: []), MenuItem(title: "Dessert 3",  ingredients: [.tomatoSauce]), MenuItem(title: "Dessert 4",  ingredients: [.carrot])]
//let menuCategories = [MenuItemCategory(category: "Food", menuItems: foodItems), MenuItemCategory(category: "Drinks", menuItems: drinkItems), MenuItemCategory(category: "Dessert", menuItems: desertItems)]

