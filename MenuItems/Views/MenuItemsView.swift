//
//  MenuItemsView.swift
//  MenuItems
//
//  Created by Bruce Burgess on 8/27/23.
//

import SwiftUI
 
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

struct GridSectionAndCell : View {
    let category : MenuItemCategory

    var body: some View {
        Section(header: SectionHeaderView(title: category.category)) {
            ForEach(category.menuItems, id: \.id) { item in
                NavigationLink(destination: MenuItemDetailsView(menuItem: item)) {
                    MenuItemCellView(item: item)
                        .foregroundColor(.black)
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






struct MenuItemsView_Previews: PreviewProvider {
    static var previews: some View {

        let foodItems = MenuItemCategory(category: "Food", menuItems: foodItemsMock)
        let drinkItems = MenuItemCategory(category: "Drinks", menuItems: drinkItemsMock)
        let dessertItems = MenuItemCategory(category: "Desserts", menuItems: desertItemsMock)
        
        let viewModel = MenuViewViewModel(
            foodMenuItems: foodItems,
            drinkMenuItems: drinkItems,
            desertMenuItems: dessertItems
        )
            
        return MenuItemsView(viewModel: viewModel)
            
    }
}
