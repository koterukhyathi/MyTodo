//
//  ViewController.swift
//  MyTodo
//
//  Created by Koteru Khyathi on 2/6/18.
//  Copyright © 2018 Koteru Khyathi. All rights reserved.
//

import UIKit

class MyTodoListViewController: UITableViewController {
    
    let itemArray = ["eat", "sleep", "code", "exercise", "repeat"]
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }

    //MARK - Table View Datasource Methods
   
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyToDoItemCell", for: indexPath)
        
        cell.textLabel?.text=itemArray[indexPath.row]
        return cell
    }
    
   //MARK - Table View Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
       if tableView.cellForRow(at: indexPath)?.accessoryType==UITableViewCellAccessoryType.checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType=UITableViewCellAccessoryType.none
        } else
        {
        tableView.cellForRow(at: indexPath)?.accessoryType=UITableViewCellAccessoryType.checkmark
        }

    }
}

