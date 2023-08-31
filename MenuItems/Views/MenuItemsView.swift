//
//  MenuItemsView.swift
//  MenuItems
//
//  Created by Bruce Burgess on 8/27/23.
//

import SwiftUI

/// This is the highest level view. Because of how SwiftUI works, it is better for code readablity to break it up. This is the Navigation view section. This goes to the MenuItemsOptionView to be able to filter and sort. This is used for Task 1 like all of the UI.
struct MenuItemsView: View {
    @State private var isPresentingDetailedView = false
    @ObservedObject var viewModel : MenuViewViewModel
    
    var body: some View {
        NavigationView {
            GridAndScrollView(viewModel: viewModel)
            .navigationTitle("Menu")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing, content: {
                    Button(action: {
                        isPresentingDetailedView.toggle()
                    }) {
                        Image(systemName: "slider.horizontal.3")
                            .font(.title)
                    }
                })
            }
            .sheet(isPresented: $isPresentingDetailedView) {
                MenuItemsOptionView(viewModel: viewModel)
            }

        }
        .padding()
    }
}

/// This is used to setup the Grid and allow it to scroll.
struct GridAndScrollView: View {
    
    let columns = [GridItem(.adaptive(minimum: 100, maximum: 300))]
    @ObservedObject var viewModel : MenuViewViewModel
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 12) {
                ForEach(viewModel.menuItemCategories, id: \.category){ category in
                    GridSectionAndCell(category: category)
                }
            }
        }
    }
    
}

/// This section up the seciton and the cells of the grid.
struct GridSectionAndCell : View {
    let category : MenuItemCategory

    var body: some View {
        Section(header: SectionHeaderView(title: category.category)) {
            ForEach(category.menuItems, id: \.id) { item in
                NavigationLink(destination: MenuItemDetailsView(menuItem: item)) {
                    MenuItemCellView(item: item)
                        .preferredColorScheme(.light)
                        .foregroundColor(.black)
                }
            }
        }
    }
}

/// This is used fo the section so that the seciton title is on the left instead of the middle
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






struct MenuItemsView_Previews: PreviewProvider {
    static var previews: some View {

        let foodItems = MenuItemCategory(category: MenuCategory.food.rawValue, menuItems: foodItemsMock)
        let drinkItems = MenuItemCategory(category: MenuCategory.drink.rawValue, menuItems: drinkItemsMock)
        let dessertItems = MenuItemCategory(category: MenuCategory.dessert.rawValue, menuItems: desertItemsMock)
        
        let viewModel = MenuViewViewModel(
            foodMenuItems: foodItems,
            drinkMenuItems: drinkItems,
            desertMenuItems: dessertItems
        )
            
        return MenuItemsView(viewModel: viewModel)
            
    }
}
