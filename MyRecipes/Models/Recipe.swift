//
//  Recipe.swift
//  MyRecipes
//
//  Created by Dongjun Lee on 11/12/24.
//

import Foundation

// Decodable = Json can be deocded into Recipe struct

struct RecipeResponse: Decodable {
    let results: [Recipe]
}


struct Recipe: Decodable {
    let title: String
    let featuredImage: String
    
    private enum CodingKeys: String, CodingKey {
        case title
        case featuredImage = "featured_image"
    }
}
