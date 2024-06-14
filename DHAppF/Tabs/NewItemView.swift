//
//  NewItemView.swift
//  DHApp
//
//  Created by Ong Eason on 9/6/2024.
//

import PhotosUI
import SwiftUI
import SwiftData

struct NewItemView: View {
    
    // MARK: Stored properties
    @State private var newItemImage: UIImage?
    @State private var nameOfFood = ""
    @State private var ingredients = ""
    @State private var calories = ""
    @State private var isToggleOn = false
    @State private var meal = 0
    @State private var date = Date()
    @State private var allergens = ""
    @Environment(\.modelContext) var modelContext

    // Binding to control whether this view is visible
    @Binding var showSheet: Bool
    
    // MARK: Computed properties
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    Picker("Meals", selection: $meal) {
                        Text("Breakfast").tag(0)
                        Text("Lunch").tag(1)
                        Text("Dinner").tag(2)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding()
                    
                    DatePicker("Date", selection: $date, displayedComponents: .date)
                        .padding()
                        .background(Rectangle()
                            .fill(Color.green)
                            .shadow(radius: 4)
                            .opacity(0.2))
                    
                    TextField("Name of Food", text: $nameOfFood)
                        .padding()
                    
                    TextField("What are the ingredients?", text: $ingredients)
                        .padding()
                    
                    TextField("What is the amount of calories?", text: $calories)
                        .padding()
                        .keyboardType(.numberPad)
                    
                    Toggle("Any Allergens?", isOn: $isToggleOn)
                        .padding()
                        .accentColor(Color.green)
                    
                    if isToggleOn {
                        TextField("What are the allergens?", text: $allergens)
                            .padding()
                    }
                    
                    Button("Save Menu") {
                        saveFoodItem(withTitle: nameOfFood)
                        clearForm()
                        showSheet = false
                    }
                    .disabled(!isFormValid())
                    .padding()
                }
            }
            .navigationTitle("New Menu Item")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        showSheet = false
                    }
                }
            }
        }
    }
    
    // MARK: Functions
    func saveFoodItem(withTitle title: String) {
        let mealTypes = ["Breakfast", "Lunch", "Dinner"]
        let menuItem = MenuItem(nameOfMeal: nameOfFood, dateOfFood: date, mealType: mealTypes[meal], image: "", ingredients: ingredients, calories: calories, hasAllergens: isToggleOn, allergens: isToggleOn ? allergens : nil)
        modelContext.insert(menuItem)
    }
    
    func clearForm() {
        nameOfFood = ""
        ingredients = ""
        calories = ""
        isToggleOn = false
        allergens = ""
    }
    
    func isFormValid() -> Bool {
        !nameOfFood.isEmpty && !ingredients.isEmpty && !calories.isEmpty && (!isToggleOn || !allergens.isEmpty)
    }
}

// Dummy preview for context
//#Preview {
//    NewItemView(showSheet: .constant(true))
//}
