//
//  MenuItemsTests.swift
//  MenuItemsTests
//
//  Created by Bruce Burgess on 8/27/23.
//

import SwiftUI
import XCTest
@testable import MenuItems


final class MenuItemsTests: XCTestCase {

    /*
     This is the first test to test the initialization of the MenuItem
     This is for Task 8 for the assignment
     */
    func test_MenuItemTitle_isSet() {
        let menuItem = MenuItem(title: "MenuTest", ingredients: [.broccoli, .tomatoSauce], price: 10.00, menuCategory: .food, orderCount: 10, image: Image(systemName: "globe"))
        XCTAssertEqual(menuItem.title, "MenuTest", "The menuItem title is \(menuItem.title), expected MenuTest")
        XCTAssertEqual(menuItem.ingredients, [.broccoli, .tomatoSauce], "The menuItem ingredents is \(menuItem.ingredients), expected \([Ingredient.broccoli, Ingredient.tomatoSauce])")
        XCTAssertEqual(menuItem.price, 10.00, "The menuItem price is \(menuItem.price), expected \(10.00)")
        XCTAssertEqual(menuItem.menuCategory, .food, "The menuItem price is \(menuItem.menuCategory), expected \(MenuCategory.food)")
        XCTAssertEqual(menuItem.orderCount, 10, "The menuItem price is \(menuItem.orderCount), expected \(10)")
        XCTAssertEqual(menuItem.image, Image(systemName: "globe"), "The menuItem price is \(menuItem.image), expected \(Image(systemName: "globe"))")
    }
    
    
    func test_SortMenuItemsAlphabetic() {
        let foodItems = [MenuItem(title: "Burger", ingredients: [], price: 10.0, menuCategory: .food, orderCount: 5, image: Image(systemName: "burger")),
                         MenuItem(title: "Pizza", ingredients: [], price: 12.0, menuCategory: .food, orderCount: 8, image: Image(systemName: "pizza"))]
        let drinkItems = [MenuItem(title: "Soda", ingredients: [], price: 2.0, menuCategory: .drink, orderCount: 3, image: Image(systemName: "soda")),
                          MenuItem(title: "Water", ingredients: [], price: 1.0, menuCategory: .drink, orderCount: 1, image: Image(systemName: "water"))]
        let desertItems = [MenuItem(title: "Ice Cream", ingredients: [], price: 4.0, menuCategory: .dessert, orderCount: 2, image: Image(systemName: "icecream")),
                           MenuItem(title: "Cake", ingredients: [], price: 6.0, menuCategory: .dessert, orderCount: 7, image: Image(systemName: "cake"))]
        
        let foodCategory = MenuItemCategory(category: "Food", menuItems: foodItems)
        let drinkCategory = MenuItemCategory(category: "Drinks", menuItems: drinkItems)
        let desertCategory = MenuItemCategory(category: "Desserts", menuItems: desertItems)
        
        let viewModel = MenuViewViewModel(
            foodMenuItems: foodCategory,
            drinkMenuItems: drinkCategory,
            desertMenuItems: desertCategory
        )
        
        viewModel.selectedSortOptions = .alphabetic
        viewModel.handleSortOrFilter()
        
        XCTAssertEqual(viewModel.testableFoodMenuItems.menuItems, foodItems.sorted { $0.title < $1.title })
        XCTAssertEqual(viewModel.testableDrinkMenuItems.menuItems, drinkItems.sorted { $0.title < $1.title })
        XCTAssertEqual(viewModel.testableDesertMenuItems.menuItems, desertItems.sorted { $0.title < $1.title })
    }
    
    func test_FilterMenu() {
            let foodItems = MenuItemCategory(category: "Food", menuItems: [])
            let drinkItems = MenuItemCategory(category: "Drinks", menuItems: [])
            let dessertItems = MenuItemCategory(category: "Desserts", menuItems: [])
            
            let viewModel = MenuViewViewModel(
                foodMenuItems: foodItems,
                drinkMenuItems: drinkItems,
                desertMenuItems: dessertItems
            )
            
            // Initially, all categories are selected
            XCTAssertEqual(viewModel.menuItemCategories.count, 3)
            
            // Deselect one category and verify
            viewModel.selectedMenuCategories.remove(.food)
            viewModel.filterMenu()
            XCTAssertEqual(viewModel.menuItemCategories.count, 2)
            XCTAssertEqual(viewModel.menuItemCategories.first?.category, "Drinks")
            
            // Deselect another category and verify
            viewModel.selectedMenuCategories.remove(.drink)
            viewModel.filterMenu()
            XCTAssertEqual(viewModel.menuItemCategories.count, 1)
            XCTAssertEqual(viewModel.menuItemCategories.first?.category, "Desserts")
            
            // Re-select categories and verify
            viewModel.selectedMenuCategories = [.food, .drink, .dessert]
            viewModel.filterMenu()
            XCTAssertEqual(viewModel.menuItemCategories.count, 3)
        }
    
    func testSortMenuItems() {
        let foodItems = MenuItemCategory(category: "Food", menuItems: [
            MenuItem(title: "Burger", ingredients: [], price: 9.99, menuCategory: .food, orderCount: 10, image: Image(systemName: "photo")),
            MenuItem(title: "Pizza", ingredients: [], price: 12.99, menuCategory: .food, orderCount: 5, image: Image(systemName: "photo")),
        ])
        
        let drinkItems = MenuItemCategory(category: "Drinks", menuItems: [
            MenuItem(title: "Coke", ingredients: [], price: 1.99, menuCategory: .drink, orderCount: 20, image: Image(systemName: "photo")),
            MenuItem(title: "Water", ingredients: [], price: 0.99, menuCategory: .drink, orderCount: 15, image: Image(systemName: "photo")),
        ])
        
        let dessertItems = MenuItemCategory(category: "Desserts", menuItems: [
            MenuItem(title: "Ice Cream", ingredients: [], price: 4.99, menuCategory: .dessert, orderCount: 8, image: Image(systemName: "photo")),
            MenuItem(title: "Cake", ingredients: [], price: 6.99, menuCategory: .dessert, orderCount: 3, image: Image(systemName: "photo")),
        ])
        
        let viewModel = MenuViewViewModel(
            foodMenuItems: foodItems,
            drinkMenuItems: drinkItems,
            desertMenuItems: dessertItems
        )
        
        // Sort menu items by price
        viewModel.selectedSortOptions = .price
        viewModel.sortMenuItems()
        
        XCTAssertEqual(viewModel.testableFoodMenuItems.menuItems.first?.title, "Burger")
        XCTAssertEqual(viewModel.testableDrinkMenuItems.menuItems.first?.title, "Water")
        XCTAssertEqual(viewModel.testableDesertMenuItems.menuItems.first?.title, "Ice Cream")
        
        // Sort menu items by order count
        viewModel.selectedSortOptions = .mostPopular
        viewModel.sortMenuItems()
        
        XCTAssertEqual(viewModel.testableFoodMenuItems.menuItems.first?.title, "Burger")
        XCTAssertEqual(viewModel.testableDrinkMenuItems.menuItems.first?.title, "Coke")
        XCTAssertEqual(viewModel.testableDesertMenuItems.menuItems.first?.title, "Ice Cream")
    }

}


