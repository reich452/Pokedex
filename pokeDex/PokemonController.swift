//
//  PokemonController.swift
//  pokeDex
//
//  Created by Nick Reichard on 2/21/17.
//  Copyright © 2017 Nick Reichard. All rights reserved.
//

import Foundation

class PokemonController {
    
    static let baseURL = URL(string: "http://pokeapi.co/api/v2/pokemon")
    
    static func fetchPokemon(for searchTerm: String, completion: @escaping (Pokemon?) -> Void) {
        
        // Always need a nil if completion is optional
        guard let unwrappedURL = baseURL else { completion(nil); return }
        
        let url = unwrappedURL.appendingPathComponent(searchTerm)
        
        NetworkController.performRequest(for: url, httpMethod: .Get) { (data, error) in
            
            // guardlet _ = error else {
            //    print("Ther was an Error")
            // completion(nil) return }
            // print(error)
            
            if let error = error {
                
                print(error.localizedDescription)
                completion(nil)
                return
            }
            
            guard let data = data else { completion(nil); return}
            
            guard let jsonDictionary = (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)) as? [String:Any] else { completion(nil); return }
            
            guard let pokemon = Pokemon(dictionary: jsonDictionary) else { completion(nil); return }
            
           
            
            ImageController.image(forURL: pokemon.imageEndpoint, completion: { (image) in
                pokemon.image = image
                
                completion(pokemon) // wont run unitl ther is an image set
            })
           
            
        }
    }
}
