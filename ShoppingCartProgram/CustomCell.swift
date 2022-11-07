//
//  CustomCell.swift
//  ShoppingCartProgram
//
//  Created by MASON ROZUMNY on 11/4/22.
//

import Foundation
import UIKit

class CustomCell: UITableViewCell
{
    
    @IBOutlet weak var itemName: UILabel!
    
    @IBOutlet weak var amountOf: UILabel!
    
    @IBOutlet weak var priceOutlet: UILabel!
    
    func configure(item: ItemClass)
    {
        itemName.text = item.itemName
        amountOf.text = "Amount: \(String(item.amount))"
        priceOutlet.text = "Price: $\(String(item.price))"
    }
    
}
