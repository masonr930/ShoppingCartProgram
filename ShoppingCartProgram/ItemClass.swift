//
//  ItemClass.swift
//  ShoppingCartProgram
//
//  Created by MASON ROZUMNY on 11/1/22.
//

import Foundation

class ItemClass: Codable
{
    var itemName: String
    var price: Double
    var amount: Int
    
    init(itemName: String, price: Double, amount: Int) {
        self.itemName = itemName
        self.price = price
        self.amount = amount
    }
    
    
    
}
