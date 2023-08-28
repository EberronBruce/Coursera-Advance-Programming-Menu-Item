//
//  MenuItemDetailsView.swift
//  MenuItems
//
//  Created by Bruce Burgess on 8/27/23.
//

import SwiftUI

struct MenuItemDetailsView: View {
    let ingredients = ["spinach", "broccoli", "carrot", "pasta", "peaches", "chicken", "peas"]
    let menuItem : MenuItem
    var body: some View {
        NavigationView {
            ScrollView {
                DetailsView(ingredients: ingredients)
            }
            .navigationTitle(menuItem.dishName)
        }
  
    }
}

private struct DetailsView : View {
    let ingredients : [String]
    var body: some View {
        VStack {
            Image("Logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: 500, maxHeight: 500)
            VStack{
                Text("Price:")
                    .fontWeight(.bold)
                Text("10.99")
            }
            .padding(4)
            VStack {
                Text("Ordered:")
                    .fontWeight(.bold)
                Text("1,000")
            }
            .padding(4)
            VStack {
                Text("Ingredients:")
                    .fontWeight(.bold)
                ForEach(ingredients, id: \.self) { ingredient in
                    Text(ingredient)
                }
            }
        }
    }
}

struct MenuItemDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        MenuItemDetailsView(menuItem: MenuItem(dishName: "Food 5"))
    }
}
