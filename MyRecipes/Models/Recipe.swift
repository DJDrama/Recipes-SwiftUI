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


struct Recipe: Decodable, Identifiable {
    var id: Int
    let title: String
    let featuredImage: URL
    
    private enum CodingKeys: String, CodingKey {
        case id = "pk"
        case title
        case featuredImage = "featured_image"
    }
}
