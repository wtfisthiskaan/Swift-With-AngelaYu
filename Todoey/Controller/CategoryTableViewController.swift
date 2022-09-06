//
//  CategoryTableViewController.swift
//  Todoey
//
//  Created by Kaan Uslu on 1.09.2022.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import UIKit
import RealmSwift
import ChameleonFramework
class CategoryTableViewController: SwipeTableViewController {

    let realm = try! Realm()
    var categories: Results<Category>?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.separatorStyle = .none
        loadCategories()
    }

    
    override func viewWillAppear(_ animated: Bool) {
        

        guard let navBar = navigationController?.navigationBar else {
            fatalError("fatal error nav bar can't created.")
        }
        
        navBar.backgroundColor = UIColor(hexString: "1D9BF6")

    }
    // MARK -- Table View Data Source Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories?.count ?? 1
    }
    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! SwipeTableViewCell
//        cell.delegate = self
//        return cell
//    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = super.tableView(tableView, cellForRowAt: indexPath)
           
        cell.textLabel?.text = categories?[indexPath.row].name ?? "no category"
   
        guard let color =  UIColor(hexString: (categories?[indexPath.row].color)!)else{
         fatalError("color can't created.")
        }
            cell.textLabel?.textColor = ContrastColorOf(color, returnFlat: true)
            
            cell.backgroundColor = color
        
        return cell
    }
    
    // MARK -- Table View Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToItems", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! TodoListViewController
        
        if let indexPath = tableView.indexPathForSelectedRow{
            destinationVC.selectedCategory = categories?[indexPath.row]
        }
    }
    
    
    // MARK -- Table View Manipulation Methods
    
    func save(category: Category){
        do{
            try realm.write({
                realm.add(category)
            })
        } catch{
            print(error)
        }
        tableView.reloadData()
    }
    
    func loadCategories(){
        
        categories = realm.objects(Category.self)
         
        
        
        tableView.reloadData()
    }
    
    //delete item
    
    override func updateModel(at indexPath: IndexPath){
        //update data model

            do{
                try self.realm.write({
                    self.realm.delete(self.categories![indexPath.row])
                })
            } catch{
                print(error)
            }
    }
    
    // add new categories.
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add new Category", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            // action on add alert
            let newItem = Category()
            newItem.name = textField.text!
            newItem.color = UIColor.randomFlat().hexValue()
            self.save(category: newItem)
            self.tableView.reloadData()
        }
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new category"
            textField = alertTextField
        }
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
}
