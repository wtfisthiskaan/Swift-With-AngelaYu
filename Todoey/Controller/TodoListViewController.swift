//
//  ViewController.swift
//  Todoey
//
//  Created by Philipp Muellauer on 02/12/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit
import RealmSwift
import ChameleonFramework
class TodoListViewController: SwipeTableViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    var todoItems: Results<Item>?
    let realm = try! Realm()
    
    var selectedCategory: Category?{
        didSet{
            loadItems()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        title = selectedCategory?.name
        
        if let colourHex = selectedCategory?.color{
            guard let navBar = navigationController?.navigationBar else {
                fatalError("fatal error nav bar can't created.")
            }
            
            if let navBarColor = UIColor(hexString: colourHex){
                navBar.barTintColor = navBarColor
                
                navBar.tintColor = ContrastColorOf(navBarColor, returnFlat: true)
                
                searchBar.barTintColor = navBarColor
            }
            
            
        }
    }
  
    //Table View Data Source Methods

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoItems?.count ?? 1
    }
   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = super.tableView(tableView, cellForRowAt: indexPath)
        if let item = todoItems?[indexPath.row]{
            cell.textLabel?.text = todoItems?[indexPath.row].title
            let color = UIColor(hexString: (self.selectedCategory?.color)!)?.darken(byPercentage: CGFloat(((indexPath.row)))/CGFloat(todoItems!.count))
            cell.backgroundColor = color
            cell.textLabel?.textColor = ContrastColorOf(color!, returnFlat: true)

            cell.accessoryType = item.done ? .checkmark : .none
        }
        else{
            cell.textLabel?.text = "no items added."
        }
        
        return cell
    }

    //delete item
    
    override func updateModel(at indexPath: IndexPath){
        //update data model
            do{
                try self.realm.write({
                    self.realm.delete(self.todoItems![indexPath.row])
                })
            } catch{
                print(error)
            }
    }
    
    //Table View Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(itemArray[indexPath.row])
        //itemArray[indexPath.row]
       
        if let item = todoItems?[indexPath.row]{
            do{
            try realm.write({
                item.done = !item.done
                
            })
            } catch{
                print("error saving")
            }
        }
        
        tableView.reloadData()

        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // add items
    
    @IBAction func addButtonPressed(_ sender: Any) {
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add new Todoey Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            // action on add alert
            if let categoryItem = self.selectedCategory{
                do{
                    try self.realm.write({
                        let newItem = Item()
                        newItem.title = textField.text!
                        newItem.dateCreated = Date()
                        categoryItem.items.append(newItem)
                    })
                } catch{
                    print(error)
                }
            }
             
            
            
            self.tableView.reloadData()
        }
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
        }
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    

    func loadItems(){
        
        todoItems = selectedCategory?.items.sorted(byKeyPath: "title", ascending: true)
        tableView.reloadData()
    }

    
}

extension TodoListViewController: UISearchBarDelegate{
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        todoItems = todoItems?.filter("title CONTAINS[cd] %@", searchBar.text!).sorted(byKeyPath: "dateCreated", ascending: true)
        
        tableView.reloadData()

    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text?.count == 0{
            loadItems()
            DispatchQueue.main.async {
                searchBar.resignFirstResponder()
            }
        }
    }
}
