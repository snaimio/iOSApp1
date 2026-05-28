import Foundation
import Combine

//  Each coffee order contains all the details the user selected
//  Made it Identifiable so SwiftUI can track each order in lists

struct CoffeeOrderItem: Identifiable {
    let id = UUID()             // Unique ID for each order - helps with list updates
    let teamMemberName: String    // Who placed the order (Alex, Jordan, etc.)
    let drinkName: String        // What they ordered
    let size: String            // S, M, L, or XL
    let sugar: Int              // 0 to 4 sugar cubes
    let milk: Int               // 0 to 4 milk shots
    let rating: Int             // 1 to 5 stars from the rating view
    let timestamp: Date          // When the order was placed
}

// Groups orders by day so history view looks cleaner
// Each day gets its own section in the list

struct OrderDay: Identifiable {
    let id = UUID()
    let date: Date
    var orders: [CoffeeOrderItem] = []
}

// Main data store, this is where all orders are saved

class OrderHistory: ObservableObject {
    @Published var orderDays: [OrderDay] = []   // Published so views update when this changes
    
    // Hardcoded team members for now, could make this dynamic later
    
    static let teamMembers = ["Alex", "Jordan", "Taylor", "Casey"]
    
    init() {
        
        // Starts with empty history
        
        orderDays = []
    }
    
    // Adds a new order to the history
    // Learned this logic from professor's addDoneExercise function
    
    func addOrder(_ order: CoffeeOrderItem) {
        let today = Date()
        let calendar = Calendar.current
        
        // Case 1: No orders yet, create first day
        
        if orderDays.isEmpty {
            orderDays.insert(OrderDay(date: today, orders: [order]), at: 0)
        }
        
        // Case 2: Today already has orders, append to existing day
        
        else if calendar.isDate(today, inSameDayAs: orderDays[0].date) {
            orderDays[0].orders.append(order)
        }
        
        // Case 3: Different day, insert new day at the top
        
        else {
            orderDays.insert(OrderDay(date: today, orders: [order]), at: 0)
        }
    }
}
