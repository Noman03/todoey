//
//  ViewController.swift
//  todoey
//
//  Created by apple on 6/17/19.
//  Copyright © 2019 apple. All rights reserved.
//

import UIKit

class todoListViewController: UITableViewController {
    
    var itemArray = [Items]()
    let defaults = UserDefaults.standard
    
     override func viewDidLoad()
    {
        super.viewDidLoad()
        let newItem = Items()
        newItem.title = "Hello Pakistan"
        itemArray.append(newItem)
        
        let newItem2 = Items()
        newItem2.title = "Hello Punjab"
        itemArray.append(newItem2)
        
        let newItem3 = Items()
        newItem3.title = "Hello Sargodhianz"
        itemArray.append(newItem3)
        
        // Do any additional setup after loading the view, typically from a nib.
        if let items = defaults.array(forKey: "TodoListArray") as? [Items]{
            itemArray = items
        }
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "todoCell")
        
        let item = itemArray[indexPath.row]
        cell?.textLabel?.text = item.title
        
        cell?.accessoryType = item.done == true ? .checkmark : .none
//        if item.done == true{
//            cell?.accessoryType = .checkmark
//        } else{
//            cell?.accessoryType = .none
//        }
        return cell!
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        tableView.reloadData()
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    @IBAction func addButtonPresses(_ sender: Any)
    {
        var textField = UITextField()
        let alert = UIAlertController(title: "Add new item", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            
            let newItem = Items()
            newItem.title = textField.text!
            self.itemArray.append(newItem)
            self.defaults.set(self.itemArray, forKey: "TodoListArray")
            self.tableView.reloadData()
        }
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Add new item"
            textField = alertTextField
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}

