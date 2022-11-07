//
//  ViewController.swift
//  ShoppingCartProgram
//
//  Created by MASON ROZUMNY on 10/31/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var priceOutlet: UITextField!
    
    @IBOutlet weak var itemOutlet: UITextField!
    
    var cart: [ItemClass] = [ItemClass]()
    
    @IBOutlet weak var tableViewOutlet: UITableView!
    
    @IBOutlet weak var amountOutlet: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableViewOutlet.delegate = self
        tableViewOutlet.dataSource = self
        priceOutlet.keyboardType = .decimalPad
        amountOutlet.keyboardType = .asciiCapableNumberPad
        
        if let items = UserDefaults.standard.data(forKey: "myCart")
        {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([ItemClass].self, from: items)
            {
                cart = decoded
            }

        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cart.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell")! as! CustomCell
        
        cell.configure(item: cart[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete
        {
            cart.remove(at: indexPath.row)
//            tableView.deleteRows(at: [indexPath], with: .fade)
            tableViewOutlet.reloadData()
            
            
        }
    }
    
    @IBAction func addAction(_ sender: UIBarButtonItem)
    {
        if itemOutlet.text != "" && priceOutlet.text != "" && amountOutlet.text != ""
        {
            var count = 0
            for x in cart
            {
                if x.itemName == itemOutlet.text
                {
                    break
                }
                else
                {
                    count+=1
                }
            }
            if count == cart.count
            {
                cart.append(ItemClass(itemName: itemOutlet.text!, price: Double(priceOutlet.text!)!, amount: Int(amountOutlet.text!)! ) )
                tableViewOutlet.reloadData()
            }
            else
            {
                let alert = UIAlertController(title: "Error", message: "You already have this item in your list!", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "Ok", style: .destructive, handler: nil)
                alert.addAction(okAction)
                present(alert, animated: true, completion: nil)
            }
        }
        else
        {
            let alert = UIAlertController(title: "Error", message: "You didn't enter an item, price, or amount!", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Ok", style: .destructive, handler: nil)
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
        }
        
    }
    
    @IBAction func saveButton(_ sender: UIBarButtonItem)
    {
    
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(cart)
        {
            UserDefaults.standard.set(encoded, forKey: "myCart")
            print("is saving")
        }
        
    }
    
    
    
    
}

