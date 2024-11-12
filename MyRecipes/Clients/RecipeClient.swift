//
//  RecipeClient.swift
//  MyRecipes
//
//  Created by Dongjun Lee on 11/12/24.
//

import Foundation

struct RecipeClient {
    func searchRecipe(_ name: String) async throws -> [Recipe] {
        guard let url = URL(string: "https://food2fork.ca/api/recipe/search/?page=2&query=\(name)") else {
            throw NetworkError.badUrl
        }
        
        // create a request
        var request = URLRequest(url: url)
        
        // set headers
        request.addValue("Token 9c8b06d329136da358c2d00e76946b0111ce2c48", forHTTPHeaderField: "Authorization")
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse,
              (200..<300).contains(httpResponse.statusCode) else {
            throw NetworkError.invalidResponse
        }
        
        guard let recipeResponse = try? JSONDecoder().decode(RecipeResponse.self, from: data) else {
            throw NetworkError.decodingError
        }
        return recipeResponse.results
    }
}

enum NetworkError: Error {
    case badUrl
    case invalidResponse
    case decodingError
}
