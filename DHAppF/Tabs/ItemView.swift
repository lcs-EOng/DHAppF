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
        VStack(alignment: .leading, spacing: 2) {
            Text(currentItem.nameOfMeal)
                .font(.headline)
                .bold()
            Text("Date: \(formatDate(currentItem.dateOfFood))")
                .font(.caption)
            Text("Meal Type: \(currentItem.mealType)")
                .font(.caption)
            Text("Ingredients: \(currentItem.ingredients)")
                .font(.caption)
            Text("Calories:\(currentItem.calories)")
                .font(.caption)
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
    
    //MARK: Functions
   private func formatDate(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        return dateFormatter.string(from: date)
    }
}

#Preview {
    let container = MenuItem.preview
    return List{
        ItemView(currentItem: MenuItem.anotherItem)
        ItemView(currentItem: MenuItem.someItem)
    }
    .modelContainer(container)
}


