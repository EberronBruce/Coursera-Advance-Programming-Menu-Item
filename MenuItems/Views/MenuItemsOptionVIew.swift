//
//  MenuItemsOptionVIew.swift
//  MenuItems
//
//  Created by Bruce Burgess on 8/27/23.
//

import SwiftUI
/// This enum is used to create the two filter sections
enum FilterSection : String, CaseIterable, Identifiable {
    var id: String { self.rawValue }
    case selectedCategories = "Selected Categories"
    case sortBy = "SORT BY"
}

/// This is the options view and it functions and allows the using to select categories and sorting. This is part of Task 1 and Task 2 in the assignement
struct MenuItemsOptionView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModel : MenuViewViewModel
        
    var body: some View {
        NavigationView {
            List {
                ForEach(FilterSection.allCases) { section in //FilterSection is outer enum
                    Section(header: Text(section.rawValue)) {
                        ListItems(section: section, viewModel: viewModel)
                    }
                }
            }
            .listStyle(.grouped)
            .navigationTitle("Filter")
            .navigationBarItems(trailing:
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Done")
                }
            )
        }
    }
}

/// This allows for the each list item in the section. It keeps track on what items are selected and what is the sort by section.
private struct ListItems : View {
    let section : FilterSection
    @State private var selectedItems: Set<String> = [] // Track selected items per section
    @State private var selectedSortOption: SortMenu = .alphabetic // Track selected sort option
    @ObservedObject var viewModel : MenuViewViewModel
    
    var body: some View {
        switch(section) {
        case .selectedCategories:
            ForEach(MenuCategory.allCases) { category in
                ItemRow(itemText: category.rawValue, isSelected: isSelected(for: category), viewModel: viewModel, menuCategory: category)
            }
        case .sortBy:
            ForEach(SortMenu.allCases) {  sortOption in
                ItemRow(itemText: sortOption.rawValue, isSelected: isSelected(for: sortOption), viewModel: viewModel, sortOption: sortOption)
            }
        }
    }
    
    /// This function is a generic and is used to se the sort options so that the checkmarks states and the states for the views for each list item.
    private func isSelected<T: RawRepresentable>(for item: T) -> Binding<Bool> where T.RawValue == String {
         Binding(
             get: {
                 if let category = item as? MenuCategory {
                     return viewModel.selectedMenuCategories.contains(category)
                 } else if let sortOption = item as? SortMenu {
                     return viewModel.selectedSortOptions == sortOption
                 }
                 return false
             },
             set: { isSelected in
                 if let category = item as? MenuCategory {
                     if isSelected {
                         viewModel.selectedMenuCategories.insert(category)
                     } else {
                         viewModel.selectedMenuCategories.remove(category)
                     }
                 } else if let sortOption = item as? SortMenu {
                     if isSelected {
                         viewModel.selectedSortOptions = sortOption
                     } else if viewModel.selectedSortOptions == sortOption {
                         //viewModel.selectedSortOptions = nil
                     }
                 }
             }
         )
     }
    
}

/// This is the row item that allows for the checkmark and allows the call through the button back to viewModel to sort and filter the items.
private struct ItemRow: View {
    var itemText: String
    var isSelected: Binding<Bool>
    @ObservedObject var viewModel : MenuViewViewModel
    var sortOption: SortMenu? = nil
    var menuCategory: MenuCategory? = nil
    
    
    var body: some View {
        Button(action: {
            isSelected.wrappedValue.toggle()
            viewModel.handleSortOrFilter()
        }) {
            HStack {
                Text(itemText)
                Spacer()
                if isSelected.wrappedValue {
                    Image(systemName: "checkmark")
                        .foregroundColor(.green)
                }
            }
        }
        .foregroundColor(Color(.label))
    }
}

struct MenuItemsOptionView_Previews: PreviewProvider {
    static var previews: some View {
        let foodItems = MenuItemCategory(category: MenuCategory.food.rawValue, menuItems: foodItemsMock)
        let drinkItems = MenuItemCategory(category: MenuCategory.drink.rawValue, menuItems: drinkItemsMock)
        let dessertItems = MenuItemCategory(category: MenuCategory.dessert.rawValue, menuItems: desertItemsMock)
        
        let viewModel = MenuViewViewModel(
            foodMenuItems: foodItems,
            drinkMenuItems: drinkItems,
            desertMenuItems: dessertItems
        )
        
        MenuItemsOptionView(viewModel: viewModel)
    }
}

