//
//  ViewController.swift
//  MyTodo
//
//  Created by Koteru Khyathi on 2/6/18.
//  Copyright © 2018 Koteru Khyathi. All rights reserved.
//

import UIKit

class MyTodoListViewController: UITableViewController {
    
    var itemArray = [Item]()
    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Items.plist")
   override func viewDidLoad()   {
        super.viewDidLoad() 
        let newIteam=Item()
        newIteam.title="eat"
        itemArray.append(newIteam)
        let newIteam2=Item()
        newIteam2.title="sleep"
        itemArray.append(newIteam2)
        let newIteam3=Item()
        newIteam3.title="code"
        itemArray.append(newIteam3)
        loadItems()
                                 }
    
    //MARK - Table View Datasource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
                                                                                                  }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyToDoItemCell", for: indexPath)
        let item = itemArray[indexPath.row]
        cell.textLabel?.text=item.title
        cell.accessoryType=item.done ? .checkmark : .none
        return cell
                                                                                                             }
    
   //MARK - Table View Delegate Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
         saveItems()
        tableView.deselectRow(at: indexPath, animated: true)
                                                                                            }
    
    //MARK - Add New Items
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        let alert = UIAlertController(title: "Add New ToDo item", message: "", preferredStyle: .alert)
        let action=UIAlertAction(title: "Add Item", style: .default) { (action) in
            
            let newIteam=Item()
            newIteam.title=textField.text!
            self.itemArray.append(newIteam)
            self.saveItems()
                                                                      }
            alert.addTextField { (alertTextField) in
            alertTextField.placeholder="create new item"
            textField = alertTextField
                                }
        alert.addAction(action)
        present(alert, animated: true)
                                                                 }
    
    func saveItems()
    {
        let encoder=PropertyListEncoder()
        do {
             let data=try encoder.encode(itemArray)
             try data.write(to: dataFilePath!)
                                                     }
        catch {
            print("Error endcoding item array, \(error)")
              }
        self.tableView.reloadData()
    }
    
    func loadItems() {
        if let data=try? Data(contentsOf: dataFilePath!) {
            let decoder=PropertyListDecoder()
        do {
            itemArray = try decoder.decode([Item].self, from: data)
            }
        catch {
            print("error recoding error \(error)")
               }
                                                          }
                      }

}
