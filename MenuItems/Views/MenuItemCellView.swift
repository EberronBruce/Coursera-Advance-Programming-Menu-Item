//
//  MenuItemCellView.swift
//  MenuItems
//
//  Created by Bruce Burgess on 8/27/23.
//

import SwiftUI

struct MenuItemCellView: View {
    @Environment(\.colorScheme) var colorScheme
    
    let itemName: String
    let itemImage: Image
    
    var body: some View {
        VStack {
            itemImage
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100)
                .background(
                    Color(colorScheme == .dark ? .white : .black)
                )
                .cornerRadius(10)
                .foregroundColor(.red)
            Text(itemName)
                .foregroundColor(Color(.label))
        }
        .frame(width: 100, height: 100)
    }
}

struct MenuItemCellView_Previews: PreviewProvider {
    static var previews: some View {
        MenuItemCellView(itemName: "Food 1", itemImage: Image("Logo"))
    }
}
