import SwiftData
import Foundation

@Model
// Define the MenuItem class
class MenuItem: Identifiable {
    var nameOfMeal: String
    var dateOfFood: Date
    var mealType: String
    var image: String
    var ingredients: String
    var calories: String
    var hasAllergens: Bool
    var allergens: String?
    
    init(nameOfMeal: String, dateOfFood: Date, mealType: String, image: String, ingredients: String, calories: String, hasAllergens: Bool, allergens: String? = nil) {
        self.nameOfMeal = nameOfMeal
        self.dateOfFood = dateOfFood
        self.mealType = mealType
        self.image = image
        self.ingredients = ingredients
        self.calories = calories
        self.hasAllergens = hasAllergens
        self.allergens = allergens
    }
}

func formatDate(_ dateString: String) -> Date {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "dd-MM-yyyy"
    return dateFormatter.date(from: dateString) ?? Date()
}


extension MenuItem{
    @MainActor
    static var preview: ModelContainer{
        let container = try! ModelContainer(
            for: MenuItem.self,
            configurations: ModelConfiguration(isStoredInMemoryOnly: true)
        )
        //Mock data
        container.mainContext.insert(
            MenuItem(nameOfMeal: "Egg benedict", dateOfFood: formatDate("01-01-2022"), mealType: "Breakfast", image: "", ingredients: "Eggs, bread, ham", calories: "250", hasAllergens: true, allergens: "Glutten")
        )
        container.mainContext.insert(
            MenuItem(nameOfMeal: "Steak", dateOfFood: formatDate("01-01-2024"), mealType: "Dinner", image: "", ingredients: "Steak, Mashed potatoes, Green Beans", calories: "600", hasAllergens: false)
        )
        return container
    }
}



