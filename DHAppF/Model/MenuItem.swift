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

func formatDate(_ date: Date) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "dd-MM-yyyy"
    return dateFormatter.string(from: date)
}

let breakfast = MenuItem(
    nameOfMeal: "Egg Benedict",
    dateOfFood: Calendar.current.date(byAdding: .day, value: -6, to: Date())!,
    mealType: "Breakfast",
    image: "egg_benedict.jpg",
    ingredients: "Eggs, Ham, English Muffin, Hollandaise Sauce",
    calories: "250",
    hasAllergens: true,
    allergens: "Egg, Dairy"
)

let lunch = MenuItem(
    nameOfMeal: "Sandwich",
    dateOfFood: Calendar.current.date(byAdding: .day, value: -5, to: Date())!,
    mealType: "Lunch",
    image: "sandwich.jpg",
    ingredients: "Bread, Cheese, Bacon, Lettuce, Tomato",
    calories: "500",
    hasAllergens: false,
    allergens: nil
)

let dinner1 = MenuItem(
    nameOfMeal: "Grilled Chicken",
    dateOfFood: Calendar.current.date(byAdding: .day, value: -4, to: Date())!,
    mealType: "Dinner",
    image: "grilled_chicken.jpg",
    ingredients: "Chicken, Olive Oil, Garlic, Lemon, Rosemary",
    calories: "350",
    hasAllergens: false,
    allergens: nil
)

let breakfast2 = MenuItem(
    nameOfMeal: "Pancakes",
    dateOfFood: Calendar.current.date(byAdding: .day, value: -3, to: Date())!,
    mealType: "Breakfast",
    image: "pancakes.jpg",
    ingredients: "Flour, Milk, Eggs, Butter, Maple Syrup",
    calories: "300",
    hasAllergens: true,
    allergens: "Gluten, Dairy, Egg"
)

let lunch2 = MenuItem(
    nameOfMeal: "Caesar Salad",
    dateOfFood: Calendar.current.date(byAdding: .day, value: -2, to: Date())!,
    mealType: "Lunch",
    image: "caesar_salad.jpg",
    ingredients: "Romaine Lettuce, Croutons, Caesar Dressing, Parmesan Cheese, Chicken",
    calories: "400",
    hasAllergens: true,
    allergens: "Fish, Dairy"
)

let dinner2 = MenuItem(
    nameOfMeal: "Spaghetti Bolognese",
    dateOfFood: Calendar.current.date(byAdding: .day, value: -1, to: Date())!,
    mealType: "Dinner",
    image: "spaghetti_bolognese.jpg",
    ingredients: "Spaghetti, Ground Beef, Tomato Sauce, Garlic, Onion, Olive Oil, Basil",
    calories: "600",
    hasAllergens: false,
    allergens: nil
)


// Create an updated example menu
let exampleMenu = [breakfast, lunch, dinner1, breakfast2, lunch2, dinner2]



