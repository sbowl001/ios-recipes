//
//  MainViewController.swift
//  Recipes
//
//  Created by Stephanie Bowles on 5/22/19.
//  Copyright © 2019 Lambda Inc. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var recipeLabel: UITextField!
    
    
    let networkClient = RecipesNetworkClient ()
    
    var allRecipes: [Recipe] = [] {
        didSet {
            filterRecipes()
        }
    }
    
    var recipesTableViewController: RecipesTableViewController? {
        didSet {
//            it should set the recipeTableViewController's recipes to the filteredRecipes. Between these two property observers, it will ensure that the table view controller has the most current array of recipes, whether filtered or not.
            recipesTableViewController?.recipes = filteredRecipes
        }
    }
    
    var filteredRecipes: [Recipe] = [] {
        didSet {
//            Add a didSet property observer to the filteredRecipes variable. It should set the recipeTableViewController's recipes to the filteredRecipes.
            recipesTableViewController?.recipes = filteredRecipes
        }
    }
    
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        networkClient.fetchRecipes { (recipes, error) in
            if let error = error {
                NSLog("there was an error fetching recipes \(error)")
                return
            }
            
            DispatchQueue.main.async {
                self.allRecipes = recipes ?? []
            }
//             If there is no error, set the value of allRecipes to recipes returned in this completion closure.

        }
       
        
       
    }
    
 
   
    func filterRecipes() {
        guard let search = recipeLabel.text?.lowercased(), search != ""  else {
            filteredRecipes = allRecipes
            return}
        let searchRecipes = allRecipes.filter ( { $0.name.lowercased().contains(search) || $0.instructions.lowercased().contains(search) } )
        filteredRecipes = searchRecipes
    
      
        }
//        Unwrap the search term
   
//  and make sure it isn't an empty string. If search term is empty or nil, set the value of filteredRecipes to allRecipes. If there is no search term, that means you should display all of the recipes.
    
//  If there is a non-empty search term in the text field, using the filter higher-order function to filter the allRecipes array. It should filter by checking if the recipe's name or instructions contains the search term. Set the value of the filteredRecipes to the result of the filter method.
    
  
  
    @IBAction func writing(_ sender: Any) {
    resignFirstResponder()
        filterRecipes()
    }
    
  
    // MARK: - Navigation

 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "EmbedTableViewSegue" {
            self.recipesTableViewController = segue.destination as? RecipesTableViewController
        }
  
    }
 

}
