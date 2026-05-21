//  Data model for the coffee ordering app.
//  Defines what an order looks like and what drink options are available.

import Foundation

// TeamOrder is a struct that represents a single coffee order.
// In a fully implemented app, this would store each person's drink choice,
// size, sugar amount, etc. For now, it's just a simplified blueprint.

struct TeamOrder {
    
    // The name of the team member placing the order (e.g., "Alex")
    
    let teamMemberName: String
    
    // A default drink (e.g., "Coffee") that could be pre-selected.
    // This property is not yet used in the UI, but shows how data would be stored.
    
    let defaultDrink: String
    
    // Enum (enumeration) defines a fixed set of possible drink types.
    // Raw values are strings, each case maps to a readable string.
    
    enum DrinkEnum: String {
        case coffee = "Coffee"
        case hotChocolate = "Hot Chocolate"
        case tea = "Tea"
        case frenchVanilla = "French Vanilla"
    }
}

//  Note: In future assignments, I wish to expand this model to include:
//  size (Small/Medium/Large)
//  sugar amount (Int)
//  isFavorite (Bool)
//  timestamp (Date)
