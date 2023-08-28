//
//  MenuItemsOptionVIew.swift
//  MenuItems
//
//  Created by Bruce Burgess on 8/27/23.
//

import SwiftUI

struct MenuItemsOptionVIew: View {
    @Environment(\.presentationMode) var presentationMode
    
    let sections = ["SELECTED CATEGRIES", "SORT BY"]
    let items = ["SELECTED CATEGRIES": ["Food", "Drinks", "Deserts"], "SORT BY" : ["Most Popular", "Price $-$$$", "A-Z"]]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(sections, id: \.self) { section in
                    Section(header: Text(section)) {
                        ForEach(items[section] ?? [], id: \.self) { item in
                            Text(item)
                        }
                    }
                }
            }
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

struct MenuItemsOptionVIew_Previews: PreviewProvider {
    static var previews: some View {
        MenuItemsOptionVIew()
    }
}
