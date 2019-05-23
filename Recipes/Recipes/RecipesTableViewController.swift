//
//  RecipesTableViewController.swift
//  Recipes
//
//  Created by Stephanie Bowles on 5/22/19.
//  Copyright © 2019 Lambda Inc. All rights reserved.
//

import UIKit

class RecipesTableViewController: UITableViewController {

    
    var recipes: [Recipe]  = [] {
        didSet {
            self.tableView.reloadData()
        }
    }
    
//    Add a didSet property observer that reloads the table view.
    override func viewDidLoad() {
        super.viewDidLoad()

     
    }

    // MARK: - Table view data source
 
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return recipes.count
    }
  
 
 

 
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecipesCell", for: indexPath)
        let recipe = self.recipes[indexPath.row]
        cell.textLabel?.text = recipe.name
     
        return cell
    }
    
 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "toShowDetail") {
            guard let indexPath = tableView.indexPathForSelectedRow,
                let destinationVC = segue.destination as? RecipeDetailViewController else {return}
            destinationVC.recipe = recipes[indexPath.row]
   
        }
    }

}
