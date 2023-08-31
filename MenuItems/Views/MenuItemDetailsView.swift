//
//  MenuItemDetailsView.swift
//  MenuItems
//
//  Created by Bruce Burgess on 8/27/23.
//

import SwiftUI

/// This is the details menu. It is part of the Task 1. It takes the menuItem. It places the UI in the scroll view.
struct MenuItemDetailsView: View {
    @State var menuItem : MenuItem
    
    var body: some View {
        ScrollView {
            DetailsView(menuItem: $menuItem)
        }
        .navigationTitle(menuItem.title)
        
  
    }
}

/// This is the details of the view. It shows the details based on the menuItem passed to it. It is part of Task 1.
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
        MenuItemDetailsView(menuItem: menuItem)
    }
}
