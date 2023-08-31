//
//  ContentView.swift
//  MenuItems
//
//  Created by Bruce Burgess on 8/27/23.
//

import SwiftUI

struct ContentView: View {
    // This viewModel is used to keep track of data state
    @ObservedObject var viewModel: MenuViewViewModel
    
    /*
     Initializing the viewModel here. In reality this would come from the web or from the database, but there needs data to make a working app.
     */
    init() {
        let foodItems = MenuItemCategory(category: MenuCategory.food.rawValue, menuItems: foodItemsMock)
        let drinkItems = MenuItemCategory(category: MenuCategory.drink.rawValue, menuItems: drinkItemsMock)
        let dessertItems = MenuItemCategory(category: MenuCategory.dessert.rawValue, menuItems: desertItemsMock)
        
        viewModel = MenuViewViewModel(
            foodMenuItems: foodItems,
            drinkMenuItems: drinkItems,
            desertMenuItems: dessertItems
        )
    }
    
    var body: some View {
        MenuItemsView(viewModel: viewModel)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
