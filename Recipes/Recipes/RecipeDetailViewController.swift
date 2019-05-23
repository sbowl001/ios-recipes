//
//  RecipeDetailViewController.swift
//  Recipes
//
//  Created by Stephanie Bowles on 5/22/19.
//  Copyright © 2019 Lambda Inc. All rights reserved.
//

import UIKit

class RecipeDetailViewController: UIViewController {

    @IBOutlet weak var recipeLabel: UILabel!
    
    
    @IBOutlet weak var detailField: UITextView!
    
    
    var recipe: Recipe? {
        didSet {
            updateViews()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
        
    }
    
    func updateViews() {
        
        guard let recipe = recipe , isViewLoaded else { return }

        recipeLabel.text = recipe.name
        detailField.text = recipe.instructions
        
    }
//      Check that the view is loaded when unwrapping the recipe object by using the view controller's isViewLoaded property.
   
  
}
