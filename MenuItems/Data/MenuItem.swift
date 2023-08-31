//
//  MenuItem.swift
//  MenuItems
//
//  Created by Bruce Burgess on 8/29/23.
//

import Foundation
import SwiftUI

/// This is the menu item delegate protocol. Though I am using it as a delegate. It was on one requirements of the project.
/// This is for Task 7 for the assignment
protocol MenuItemDelegate {
    var id: UUID { get }
    var price : Double { get }
    var title : String { get }
    var menuCategory : MenuCategory { get }
    var orderCount : Int { get set }
    var ingredients : [Ingredient] { get set}
    var image : Image { get set }
}

/// This is the structure that holds the menu item data. It conforms to the MenuItemDelegate
/// This is for Task 4 and Taks 7 for the assignment
struct MenuItem : Identifiable, MenuItemDelegate {

    let id : UUID
    let title: String
    var ingredients : [Ingredient]
    var price: Double
    var menuCategory: MenuCategory
    var orderCount: Int
    var image : Image
    
    init(title: String, ingredients: [Ingredient], price: Double, menuCategory: MenuCategory, orderCount: Int, image: Image) {
        self.id = UUID()
        self.title = title
        self.ingredients = ingredients
        self.price = price
        self.menuCategory = menuCategory
        self.orderCount = orderCount
        self.image = image
    }

}


// MARK: - Mock Data
/*
    This is the mock data used in the app for testing the application and setting up the some base data to use in the app
    This is for Task 5 in the assignment
 */
let menuItemMock = MenuItem(title: "Food 5", ingredients: [.broccoli, .carrot, .pasta, .spinach], price: 10.99, menuCategory: .food, orderCount: 1000, image: Image("Logo"))
let foodItemsMock = [MenuItem(title: "Food 1", ingredients: [.pasta, .spinach, .tomatoSauce], price: 5.99, menuCategory: .food, orderCount: 120, image: Image(systemName: "fork.knife")),
                 MenuItem(title: "Food 2", ingredients: [.broccoli, .spinach, .tomatoSauce], price: 6.99, menuCategory: .food, orderCount: 300, image: Image(systemName: "fork.knife")),
                 MenuItem(title: "Food 3", ingredients: [.broccoli, .carrot, .spinach, .tomatoSauce], price: 15.99, menuCategory: .food, orderCount: 500, image: Image(systemName: "fork.knife")),
                 MenuItem(title: "Food 4", ingredients: [.broccoli, .pasta, .spinach, .tomatoSauce], price: 20.99, menuCategory: .food, orderCount: 10000, image: Image(systemName: "fork.knife")),
                 MenuItem(title: "Food 5", ingredients: [.broccoli, .carrot, .pasta, .spinach], price: 10.99, menuCategory: .food, orderCount: 1000, image: Image(systemName: "fork.knife")),
                 MenuItem(title: "Food 6", ingredients: [.carrot, .pasta, .spinach, .tomatoSauce], price: 13.99, menuCategory: .food, orderCount: 10, image: Image(systemName: "fork.knife")),
                 MenuItem(title: "Food 7", ingredients: [.broccoli, .tomatoSauce], price: 20.99, menuCategory: .food, orderCount: 150, image: Image(systemName: "fork.knife")),
                 MenuItem(title: "Food 8", ingredients: [.pasta, .tomatoSauce], price: 24.99, menuCategory: .food, orderCount: 200, image: Image(systemName: "fork.knife")),
                 MenuItem(title: "Food 9", ingredients: [.pasta, .spinach, .tomatoSauce], price: 17.99, menuCategory: .food, orderCount: 150, image: Image(systemName: "fork.knife")),
                 MenuItem(title: "Food 10", ingredients: [.broccoli, .carrot], price: 19.99, menuCategory: .food, orderCount: 400, image: Image(systemName: "fork.knife")),
                 MenuItem(title: "Food 11", ingredients: [.broccoli, .tomatoSauce], price: 17.99, menuCategory: .food, orderCount: 4400, image: Image(systemName: "fork.knife")),
                 MenuItem(title: "Food 12", ingredients: [.broccoli], price: 16.99, menuCategory: .food, orderCount: 1212, image: Image(systemName: "fork.knife"))]

let drinkItemsMock = [MenuItem(title: "Drink 1", ingredients: [.tomatoSauce], price: 5.99, menuCategory: .drink, orderCount: 50, image: Image(systemName: "wineglass.fill")),
                  MenuItem(title: "Drink 2", ingredients: [.carrot], price: 2.99, menuCategory: .drink, orderCount: 1000, image: Image(systemName: "wineglass.fill")),
                  MenuItem(title: "Drink 3", ingredients: [.broccoli], price: 8.99, menuCategory: .drink, orderCount: 200, image: Image(systemName: "wineglass.fill")),
                  MenuItem(title: "Drink 4", ingredients: [.spinach, .tomatoSauce], price: 3.99, menuCategory: .drink, orderCount: 1100, image: Image(systemName: "wineglass.fill")),
                  MenuItem(title: "Drink 5", ingredients: [.broccoli, .carrot, .spinach, .tomatoSauce], price: 10.99, menuCategory: .drink, orderCount: 130, image: Image(systemName: "wineglass.fill")),
                  MenuItem(title: "Drink 6", ingredients: [.spinach, .tomatoSauce], price: 7.99, menuCategory: .drink, orderCount: 100, image: Image(systemName: "wineglass.fill")),
                  MenuItem(title: "Drink 7", ingredients: [.broccoli, .spinach, .tomatoSauce], price: 14.99, menuCategory: .drink, orderCount: 1004, image: Image(systemName: "wineglass.fill")),
                  MenuItem(title: "Drink 8", ingredients: [.broccoli, .spinach, .tomatoSauce], price: 12.99, menuCategory: .drink, orderCount: 1020, image: Image(systemName: "wineglass.fill"))]
let desertItemsMock = [MenuItem(title: "Dessert 1", ingredients: [.tomatoSauce], price: 3.99, menuCategory: .dessert, orderCount: 10000, image: Image(systemName: "birthday.cake.fill")),
                   MenuItem(title: "Dessert 2", ingredients: [.carrot], price: 5.99, menuCategory: .dessert, orderCount: 5329, image: Image(systemName: "birthday.cake.fill")),
                   MenuItem(title: "Dessert 3", ingredients: [.spinach, .tomatoSauce], price: 6.99, menuCategory: .dessert, orderCount: 195, image: Image(systemName: "birthday.cake.fill")),
                   MenuItem(title: "Dessert 4", ingredients: [.broccoli, .carrot, .spinach, .tomatoSauce], price: 8.99, menuCategory: .dessert, orderCount: 250, image: Image(systemName: "birthday.cake.fill"))]

