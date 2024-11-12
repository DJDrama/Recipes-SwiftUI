//
//  ContentView.swift
//  MyRecipes
//
//  Created by Dongjun Lee on 11/12/24.
//

import SwiftUI

struct ContentView: View {
    @State private var recipeName: String = ""
    @State private var recipes: [Recipe] = []
    
    let recipeClient = RecipeClient()
    
    var body: some View {
        VStack {
            TextField("Enter name", text: $recipeName)
                .textFieldStyle(.roundedBorder)
                .onSubmit {
                    Task{
                        do {
                            recipes = try await recipeClient.searchRecipe(recipeName)
                        } catch {
                            print(error)
                        }
                    }
                }
                .padding()
            
            List(recipes) { recipe in
                HStack {
                    AsyncImage(url: recipe.featuredImage) { image in
                        image.resizable()
                            .clipShape(RoundedRectangle(cornerRadius: 24.0, style: .continuous))
                            .frame(width: 100, height: 100)
                    } placeholder: {
                        ProgressView("Loading")
                    }

                    Text(recipe.title)
                }
            }
        }
        
    }
}

#Preview {
    ContentView()
}
