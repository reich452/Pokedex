//
//  PokedexViewController.swift
//  pokeDex
//
//  Created by Nick Reichard on 2/21/17.
//  Copyright © 2017 Nick Reichard. All rights reserved.
//

import UIKit

class PokedexViewController: UIViewController, UISearchBarDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var movesLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self 
        
        PokemonController.fetchPokemon(for: "test") { (pokemon) in
            print("Something")
        }
    }
    
    // MARK: - Searchbar delegate functions
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        guard let searchTerm = searchBar.text else { return }
        
        PokemonController.fetchPokemon(for: searchTerm) { (pokemon) in  // wont run unitl
            
            // It has to go and find the pokemon
            guard let pokemon = pokemon else { return }
            self.updateViews(with: pokemon)
            
        }
    }
    
    func updateViews(with pokemon: Pokemon) {
        
        imageView.image = pokemon.image
        nameLabel.text = pokemon.name
        idLabel.text = " \(pokemon.id) "
        movesLabel.text = " \(pokemon.moveCount) "
        
        
    }
    
}
