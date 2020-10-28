//
//  ViewController.swift
//  GivenRecipe
//
//  Created by Christian Elijah on 2020-09-03.
//  Copyright © 2020 Christian Elijah. All rights reserved.
//

import UIKit

struct RecipeData {
    var title: String
    var image: UIImage
}

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UISearchBarDelegate {
    
    let recipeData = [
        RecipeData(title: "Fruity Crackers", image: #imageLiteral(resourceName: "brooke-lark-M4E7X3z80PQ-unsplash")),
        RecipeData(title: "Zesty Pasta", image: #imageLiteral(resourceName: "eaters-collective-ddZYOtZUnBk-unsplash")),
        RecipeData(title: "Veggie Bowl", image: #imageLiteral(resourceName: "brooke-lark-jUPOXXRNdcA-unsplash")),
        RecipeData(title: "Chocolate Covered Pancakes", image: #imageLiteral(resourceName: "whitney-wright-6G98hiCJETA-unsplash")),
        RecipeData(title: "Italian Pizza", image: #imageLiteral(resourceName: "carissa-gan-_0JpjeqtSyg-unsplash")),
        RecipeData(title: "French Stirloin", image: #imageLiteral(resourceName: "alex-munsell-Yr4n8O_3UPc-unsplash"))
    ]
    
    // SearchBar
    let searchController = UISearchController(searchResultsController: nil)
    var filteredRecipes: [RecipeData]!
    var searchActive: Bool = false
    
    // Outlets
    @IBOutlet var searchView: UIView!
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var foodCollection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Search Bar Functionality
        searchBar.delegate = self
        filteredRecipes = recipeData
        
        // Layout
        layoutSetup()
        
        // Styling
        searchViewStyle()
        
        //Delegate and DataSource Setup
        foodCollection.delegate = self
        foodCollection.dataSource = self
    }
    
    // MARK: Search Bar
    
    /*
     title.title.localizedCaseInsensitiveContains(searchText)
     */
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredRecipes = recipeData.filter { food in
            
            return food.title.lowercased().contains(searchText.lowercased())
        }
        
        if (filteredRecipes.count == 0) {
            searchActive = false
        } else {
            searchActive = true
        }
        self.foodCollection.reloadData()
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchActive = false
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchActive = true
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false
    }
    
    
    
    // Layout might remove
    func layoutSetup() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.register(RecipeCollectionViewCell.self, forCellWithReuseIdentifier: "recipeCell")
    }

    func searchViewStyle() {
        searchView.layer.shadowOpacity = 0.4
        searchView.layer.shadowColor = UIColor.black.cgColor
        searchView.layer.shadowOffset = .zero
        searchView.layer.shadowRadius = 8
        searchView.layer.cornerRadius = 20
        
        searchBar.layer.cornerRadius = 20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: foodCollection.frame.width/1.6, height: foodCollection.frame.width/1.6)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if searchActive {
            return filteredRecipes.count
        }
        return recipeData.count
    }
       
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let recipeCells = foodCollection.dequeueReusableCell(withReuseIdentifier: "recipeCell", for: indexPath) as! RecipeCollectionViewCell
        recipeCells.data = self.recipeData[indexPath.row]
        return recipeCells
    }

}


