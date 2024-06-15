//
//  ViewModel.swift
//  DHApp
//
//  Created by Ong Eason on 9/6/2024.
//

import Foundation



@Observable
class MenuViewModel: ObservableObject {
    var foods: [MenuItem]
    
    init(foods:[MenuItem] = []){
        self.foods = foods
    }
    
    //MARK: Functions
    func saveFoodItem(nameOfFood: String, date: Date, meal: Int, ingredients: String, calories: String, isToggleOn: Bool, allergens: String?) {
        let mealTypes = ["Breakfast", "Lunch", "Dinner"]
        let menuItem = MenuItem(
            nameOfMeal: nameOfFood,
            dateOfFood: date,
            mealType: mealTypes[meal],
            image: "",
            ingredients: ingredients,
            calories: calories,
            hasAllergens: isToggleOn,
            allergens: isToggleOn ? allergens : nil
        )
        
        //Append the array
        foods.append(menuItem)
        
    }
    func delete(_ menuItem: MenuItem) {
        
        // Remove the provided to-do item from the array
        foods.removeAll { currentItem in
            currentItem.id == menuItem.id
        }
        
        
    }
}




