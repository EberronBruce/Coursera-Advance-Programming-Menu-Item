//
//  MenuItemsView.swift
//  MenuItems
//
//  Created by Bruce Burgess on 8/27/23.
//

import SwiftUI
 
struct MenuItemsView: View {
    @State private var isPresentingDetailedView = false
    
    var body: some View {
        NavigationView {
            GridAndScrollView()
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
                MenuItemsOptionVIew()
            }

        }
        .padding()
    }
}

struct GridAndScrollView: View {
    
    let columns = [GridItem(.adaptive(minimum: 100, maximum: 300))]
    
    var body: some View {
        ScrollView {
//            LazyVGrid(columns: columns, spacing: 12) {
//                ForEach(menuCategories, id: \.category){ category in
//                    Section(header: SectionHeaderView(title: category.category)) {
//                        ForEach(category.menuItems, id: \.id) { item in
//                            NavigationLink(destination: MenuItemDetailsView(menuItem: item)) {
//                                MenuItemCellView(itemName: item.title, itemImage: Image(systemName: "fork.knife"))
//                            }
//                        }
//                    }
//                }
//            }
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
        MenuItemsView()
    }
}
