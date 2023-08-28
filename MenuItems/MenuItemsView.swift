//
//  MenuItemsView.swift
//  MenuItems
//
//  Created by Bruce Burgess on 8/27/23.
//

import SwiftUI
 
struct MenuItemsView: View {
    
    var body: some View {
        NavigationView {
            GridAndScrollView()
            .navigationTitle("Menu")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing, content: {
                    Button(action: {
                        print("Navigate")
                    }) {
                        Image(systemName: "slider.horizontal.3")
                            .font(.title)
                    }
                })
            }

        }
        .padding()
    }
}

struct GridAndScrollView: View {
    
    let columns = [GridItem(.adaptive(minimum: 120, maximum: 300))]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 12) {
                ForEach(menuCategories, id: \.category){ category in
                    Section(header: SectionHeaderView(title: category.category)) {
                        ForEach(category.menuItems, id: \.id) { item in
                            NavigationLink(destination: MenuItemDetailsView()) {
                                MenuItemCellView(itemName: item.dishName, itemImage: Image(systemName: "fork.knife"))
                            }
                        }
                    }
                }
            }
        }
    }
    
}


struct SectionHeaderView: View {
    let title: String
    
    var body: some View {
        Text(title)
            .font(.title2)
            .padding(.leading, 16) // Adjust the padding as needed
            .frame(maxWidth: .infinity, alignment: .leading) // Align the header text to the left
            .background(Color.clear)
    }
}


struct MenuCategory {
    let category: String
    let menuItems : [MenuItem]
}

struct MenuItem {
    let id = UUID()
    let dishName: String
}

let foodItems = [MenuItem(dishName: "Food 1"), MenuItem(dishName: "Food 2"), MenuItem(dishName: "Food 3"), MenuItem(dishName: "Food 4"), MenuItem(dishName: "Food 5"), MenuItem(dishName: "Food 6"), MenuItem(dishName: "Food 7"), MenuItem(dishName: "Food 8"), MenuItem(dishName: "Food 9"), MenuItem(dishName: "Food 10"), MenuItem(dishName: "Food 11"), MenuItem(dishName: "Food 12")]
let drinkItems = [MenuItem(dishName: "Drink 1"), MenuItem(dishName: "Drink 2"), MenuItem(dishName: "Drink 3"), MenuItem(dishName: "Drink 4"), MenuItem(dishName: "Drink 5"), MenuItem(dishName: "Drink 6"), MenuItem(dishName: "Drink 7"), MenuItem(dishName: "Drink 8")]
let desertItems = [MenuItem(dishName: "Dessert 1"), MenuItem(dishName: "Dessert 2"), MenuItem(dishName: "Dessert 3"), MenuItem(dishName: "Dessert 4")]
let menuCategories = [MenuCategory(category: "Food", menuItems: foodItems), MenuCategory(category: "Drinks", menuItems: drinkItems), MenuCategory(category: "Dessert", menuItems: desertItems)]



struct MenuItemsView_Previews: PreviewProvider {
    static var previews: some View {
        MenuItemsView()
    }
}
