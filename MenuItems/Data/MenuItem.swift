//
//  MenuItem.swift
//  MenuItems
//
//  Created by Bruce Burgess on 8/29/23.
//

import Foundation
import SwiftUI

protocol MenuItemDelegate {
    var id: UUID { get }
    var price : Double { get }
    var title : String { get }
    var menuCategory : MenuCategory { get }
    var orderCount : Int { get set }
    var ingredients : [Ingredient] { get set}
    var image : Image { get set }
}

struct MenuItemCategory {
    let category: String
    let menuItems : [MenuItem]
}

struct MenuItem : Identifiable, MenuItemDelegate {

    let id : UUID
    let title: String
    var ingredients : [Ingredient]
    var price: Double
    var menuCategory: MenuCategory
    var orderCount: Int
    var image : Image
    
    init(title: String, ingredients: [Ingredient], price: Double, menuCategory: MenuCategory, orderCount: Int, image: Image) {
        self.id = UUID()
        self.title = title
        self.ingredients = ingredients
        self.price = price
        self.menuCategory = menuCategory
        self.orderCount = orderCount
        self.image = image
    }

}
