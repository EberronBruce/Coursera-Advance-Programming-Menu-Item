//
//  MenuItemCellView.swift
//  MenuItems
//
//  Created by Bruce Burgess on 8/27/23.
//

import SwiftUI

struct MenuItemCellView: View {
    @Environment(\.colorScheme) var colorScheme
    let item : MenuItem
    
    var body: some View {
        VStack {
            item.image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100)
                .cornerRadius(10)
                
            Text(item.title)
                .foregroundColor(Color(.label))
        }
        .frame(width: 100, height: 100)
    }
}

struct MenuItemCellView_Previews: PreviewProvider {
    static var previews: some View {
        MenuItemCellView(item: menuItemMock)
    }
}
