//
//  ItemView.swift
//  DHAppF
//
//  Created by Ong Eason on 14/6/2024.
//
import SwiftData
import SwiftUI

struct ItemView: View {
    
   @Bindable var currentItem: MenuItem
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(currentItem.nameOfMeal)
                .font(.headline)
            Text("Date: \(formatDate(currentItem.dateOfFood))")
            Text("Meal Type: \(currentItem.mealType)")
            Text("Ingredients: \(currentItem.ingredients)")
            Text("Calories:\(currentItem.calories)")
            if currentItem.hasAllergens {
                Text("Allergens: \(currentItem.allergens ?? "Unknown")")
                    .foregroundColor(.red)
            } else {
                Text("No Allergens")
                    .foregroundColor(.green)
            }
        }
        .padding()
    }
}

//#Preview {
//    ItemView(currentItem: dinner1)
//}


