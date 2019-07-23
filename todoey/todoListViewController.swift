//
//  ViewController.swift
//  todoey
//
//  Created by apple on 6/17/19.
//  Copyright © 2019 apple. All rights reserved.
//

import UIKit

class todoListViewController: UITableViewController {
    
    let itemArray = ["Hello Sargodha", "Hello Punjab", "Hello Pakistan", "Hello World" ]
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "todoCell")
        cell?.textLabel?.text = itemArray[indexPath.row]
        return cell!
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = itemArray[indexPath.row]
        //print(data)
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark{
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    


}

