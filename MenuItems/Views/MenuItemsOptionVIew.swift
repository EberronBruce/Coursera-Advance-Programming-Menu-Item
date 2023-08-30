//
//  MenuItemsOptionVIew.swift
//  MenuItems
//
//  Created by Bruce Burgess on 8/27/23.
//

import SwiftUI
enum FilterSection : String, CaseIterable, Identifiable {
    var id: String { self.rawValue }
    case selectedCategories = "Selected Categories"
    case sortBy = "SORT BY"
}

enum SortMenu: String, CaseIterable, Identifiable {
    var id: String { self.rawValue }
    case mostPopular = "Most Popular"
    case price = "Price $-$$$"
    case alphabetic = "A-Z"
}

struct MenuItemsOptionVIew: View {
    @Environment(\.presentationMode) var presentationMode
        
    var body: some View {
        NavigationView {
            List {
                ForEach(FilterSection.allCases) { section in //FilterSection is outer enum
                    Section(header: Text(section.rawValue)) {
                        ListItems(section: section)
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

private struct ListItems : View {
    let section : FilterSection
    @State private var selectedRow: String? = nil // Track selected row per section
    
    var body: some View {
        switch(section) {
        case .selectedCategories:
            ForEach(MenuCategory.allCases) { category in
                ItemRow(itemText: category.rawValue, isSelected: isSelected(for: category))
            }
        case .sortBy:
            ForEach(SortMenu.allCases) {  sortOption in
                ItemRow(itemText: sortOption.rawValue, isSelected: isSelected(for: sortOption))
            }
        }
    }
    
    private func isSelected<T: RawRepresentable>(for item: T) -> Binding<Bool> where T.RawValue == String {
        Binding(
            get: { selectedRow == item.rawValue },
            set: { isSelected in
                if isSelected {
                    selectedRow = item.rawValue
                } else {
                    selectedRow = nil
                }
            }
        )
    }
}

private struct ItemRow: View {
    var itemText: String
    var isSelected: Binding<Bool>
    
    var body: some View {
        Button(action: {
            isSelected.wrappedValue.toggle()
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

struct MenuItemsOptionVIew_Previews: PreviewProvider {
    static var previews: some View {
        MenuItemsOptionVIew()
    }
}

