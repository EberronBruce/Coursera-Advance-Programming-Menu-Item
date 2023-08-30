//
//  MenuItemDetailsView.swift
//  MenuItems
//
//  Created by Bruce Burgess on 8/27/23.
//

import SwiftUI

struct MenuItemDetailsView: View {
    @Binding var menuItem : MenuItem
    
    var body: some View {
        NavigationView {
            ScrollView {
                DetailsView(menuItem: $menuItem)
            }
            .navigationTitle(menuItem.title)
        }
  
    }
}

private struct DetailsView : View {
    @Binding var menuItem : MenuItem
    
    var body: some View {
        VStack {
            menuItem.image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: 500, maxHeight: 500)
            VStack{
                Text("Price:")
                    .fontWeight(.bold)
                Text(String(format: "%.2f", menuItem.price))
            }
            .padding(4)
            VStack {
                Text("Ordered:")
                    .fontWeight(.bold)
                Text("\(menuItem.orderCount)")
            }
            .padding(4)
            VStack {
                Text("Ingredients:")
                    .fontWeight(.bold)
                ForEach(menuItem.ingredients, id: \.self) { ingredient in
                    Text(ingredient.rawValue)
                }
            }
        }
    }
}

struct MenuItemDetailsView_Previews: PreviewProvider {
    @State static private var menuItem = MenuItem(title: "Food 5", ingredients: [.broccoli, .carrot, .pasta, .spinach,.tomatoSauce], price: 16.45, menuCategory: .food, orderCount: 1000, image: Image("Logo"))
    
    static var previews: some View {
        MenuItemDetailsView(menuItem: $menuItem)
    }
}
