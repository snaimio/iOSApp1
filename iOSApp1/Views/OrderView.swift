import SwiftUI

struct OrderView: View {
    @Binding var selectedTab: Int
    let index: Int
    @State private var showHistory = false
    
    let teamMembers = ["Alex", "Jordan", "Taylor", "Casey"]
    
    let drinkMenu = [
        ("Coffee", 1.50, "cup.and.saucer.fill"),
        ("Hot Chocolate", 2.50, "mug.fill"),
        ("Tea", 1.50, "leaf.fill"),
        ("Latte", 3.50, "takeoutbag.and.cup.and.straw.fill"),
        ("French Vanilla", 3.00, "wand.and.stars"),
        ("Cappuccino", 3.50, "cup.and.saucer.fill")
    ]
    
    let sizes = ["S", "M", "L", "XL"]
    let sizeMultipliers = [0.8, 1.0, 1.3, 1.6]  // S=0.8, M=1.0, L=1.3, XL=1.6
    let sugarMilkOptions = ["0", "1", "2", "3", "4"]
    
    @State private var selectedDrinkIndex = 0
    @State private var selectedSize = 1      // Default = Medium (index 1)
    @State private var selectedSugar = 2     // Default = 2 sugars
    @State private var selectedMilk = 2      // Default = 2 milk
    @State private var rating = 0
    @State private var showTimer = false
    @State private var timerDone = false
    @State private var showSuccess = false
    @State private var showRating = false
    
    @EnvironmentObject var orderHistory: OrderHistory
    
    var teamName: String {
        teamMembers[index]
    }
    
    var lastPerson: Bool {
        index + 1 == teamMembers.count
    }
    
    var drinkPrice: Double {
        drinkMenu[selectedDrinkIndex].1
    }
    
    var drinkIcon: String {
        drinkMenu[selectedDrinkIndex].2
    }
    
    // Calculate total price based on selected drink and selected size
    
    var totalPrice: Double {
        let basePrice = drinkPrice
        let multiplier = sizeMultipliers[selectedSize]
        let price = basePrice * multiplier
        
        // Round to 2 decimal places to avoid floating point issues
        
        return (price * 100).rounded() / 100
    }
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack(spacing: 12) {
                    HeaderView(selectedTab: $selectedTab, titleText: "\(teamName)'s Order", showHistory: $showHistory, showPageNumbers: true)
                    
                    // Dynamic drink icon
                    
                    Image(systemName: drinkIcon)
                        .font(.system(size: 50))
                        .foregroundColor(Color.coffeeBrown)
                        .animation(.easeInOut(duration: 0.2), value: selectedDrinkIndex)
                    
                    // Drink selection menu
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Select Drink")
                            .font(.headline)
                            .foregroundColor(.gray)
                            .frame(maxWidth: .infinity, alignment: .center)
                        
                        ForEach(0..<drinkMenu.count, id: \.self) { i in
                            Button(action: {
                                selectedDrinkIndex = i
                            }) {
                                HStack {
                                    Image(systemName: selectedDrinkIndex == i ? "checkmark.circle.fill" : "circle")
                                        .foregroundColor(selectedDrinkIndex == i ? .green : .gray)
                                        .font(.body)
                                    
                                    Text(drinkMenu[i].0)
                                        .font(.body)
                                        .foregroundColor(.primary)
                                    
                                    Spacer()
                                    
                                    Text("$\(drinkMenu[i].1, specifier: "%.2f")")
                                        .font(.body)
                                        .foregroundColor(Color.coffeeBrown)
                                }
                                .padding(.vertical, 4)
                            }
                        }
                    }
                    .padding(.horizontal, 30)
                    
                    // Size, Sugar, Milk pickers
                    
                    VStack(alignment: .leading, spacing: 10) {
                        
                        // Size picker - S, M, L, XL
                        
                        HStack(spacing: 15) {
                            Text("Size")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                                .frame(width: 50, alignment: .leading)
                            
                            HStack(spacing: 6) {
                                ForEach(0..<sizes.count, id: \.self) { i in
                                    Button(action: {
                                        selectedSize = i
                                    }) {
                                        Text(sizes[i])
                                            .font(.subheadline)
                                            .fontWeight(selectedSize == i ? .bold : .regular)
                                            .foregroundColor(selectedSize == i ? .white : Color.coffeeBrown)
                                            .frame(width: 35, height: 28)
                                            .background(
                                                RoundedRectangle(cornerRadius: 6)
                                                    .fill(selectedSize == i ? Color.coffeeBrown : Color.coffeeBrown.opacity(0.15))
                                            )
                                    }
                                }
                            }
                        }
                        
                        // Sugar picker
                        
                        HStack(spacing: 15) {
                            Text("Sugar")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                                .frame(width: 50, alignment: .leading)
                            
                            HStack(spacing: 5) {
                                ForEach(0..<sugarMilkOptions.count, id: \.self) { i in
                                    Button(action: {
                                        selectedSugar = i
                                    }) {
                                        Text(sugarMilkOptions[i])
                                            .font(.subheadline)
                                            .fontWeight(selectedSugar == i ? .bold : .regular)
                                            .foregroundColor(selectedSugar == i ? .white : Color.coffeeBrown)
                                            .frame(width: 30, height: 28)
                                            .background(
                                                RoundedRectangle(cornerRadius: 6)
                                                    .fill(selectedSugar == i ? Color.coffeeBrown : Color.coffeeBrown.opacity(0.15))
                                            )
                                    }
                                }
                            }
                        }
                        
                        // Milk picker, using blue color to differentiate from sugar
                        HStack(spacing: 15) {
                            Text("Milk")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                                .frame(width: 50, alignment: .leading)
                            
                            HStack(spacing: 5) {
                                ForEach(0..<sugarMilkOptions.count, id: \.self) { i in
                                    Button(action: {
                                        selectedMilk = i
                                    }) {
                                        Text(sugarMilkOptions[i])
                                            .font(.subheadline)
                                            .fontWeight(selectedMilk == i ? .bold : .regular)
                                            .foregroundColor(selectedMilk == i ? .white : .blue)
                                            .frame(width: 30, height: 28)
                                            .background(
                                                RoundedRectangle(cornerRadius: 6)
                                                    .fill(selectedMilk == i ? Color.blue : Color.blue.opacity(0.15))
                                            )
                                    }
                                }
                            }
                        }
                    }
                    .padding(.horizontal, 20)
                    
                    // Total price display
                    // The id forces SwiftUI to redraw when size or drink changes
                    
                    Text("Total: $\(totalPrice, specifier: "%.2f")")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.coffeeBrown)
                        .padding(.top, 4)
                        .id(selectedSize + selectedDrinkIndex * 10)  // Forces refresh when either changes
                    
                    // Timer and order flow
                    
                    if showTimer {
                        if !timerDone {
                            VStack(spacing: 8) {
                                Text("Preparing...")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                                
                                TimerView(timerDone: $timerDone, size: 50)
                            }
                            .frame(height: 100)
                        }
                        
                        if timerDone && !showRating {
                            VStack(spacing: 8) {
                                Image(systemName: "checkmark.circle.fill")
                                    .font(.system(size: 40))
                                    .foregroundColor(.green)
                                Text("Order ready!")
                                    .font(.subheadline)
                                    .foregroundColor(.green)
                                
                                Button(action: {
                                    showRating = true
                                }) {
                                    Text("Rate Your Drink")
                                        .font(.subheadline)
                                        .foregroundColor(.white)
                                        .frame(width: 160, height: 35)
                                        .background(Color.orange)
                                        .cornerRadius(16)
                                }
                            }
                            .frame(height: 120)
                        }
                        
                        if showRating {
                            VStack(spacing: 8) {
                                Text("Rate your drink")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                                
                                RatingView(rating: $rating)
                                    .padding(.vertical, 5)
                                
                                Button(action: {
                                    let order = CoffeeOrderItem(
                                        teamMemberName: teamName,
                                        drinkName: drinkMenu[selectedDrinkIndex].0,
                                        size: sizes[selectedSize],
                                        sugar: selectedSugar,
                                        milk: selectedMilk,
                                        rating: rating,
                                        timestamp: Date()
                                    )
                                    orderHistory.addOrder(order)
                                    
                                    if lastPerson {
                                        showSuccess = true
                                    } else {
                                        selectedTab += 1
                                    }
                                    resetOrder()
                                }) {
                                    Text("Next")
                                        .font(.subheadline)
                                        .foregroundColor(.white)
                                        .frame(width: 140, height: 35)
                                        .background(Color.green)
                                        .cornerRadius(16)
                                }
                            }
                            .frame(height: 150)
                        }
                    } else {
                        Button(action: {
                            showTimer = true
                        }) {
                            Text("Place Order")
                                .font(.headline)
                                .foregroundColor(.white)
                                .frame(width: 200, height: 45)
                                .background(Color.coffeeBrown)
                                .cornerRadius(22)
                        }
                        .padding(.vertical, 10)
                    }
                    
                    // Home and History buttons
                    HStack(spacing: 30) {
                        Button(action: {
                            selectedTab = 0
                        }) {
                            HStack(spacing: 6) {
                                Image(systemName: "house.fill")
                                    .font(.caption)
                                Text("Home")
                                    .font(.caption)
                            }
                            .foregroundColor(.white)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 8)
                            .background(Color.coffeeBrown)
                            .cornerRadius(20)
                        }
                        
                        Button(action: {
                            showHistory.toggle()
                        }) {
                            HStack(spacing: 6) {
                                Image(systemName: "clock.fill")
                                    .font(.caption)
                                Text("History")
                                    .font(.caption)
                            }
                            .foregroundColor(.white)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 8)
                            .background(Color.coffeeBrown)
                            .cornerRadius(20)
                        }
                    }
                    .padding(.bottom, 15)
                }
                .frame(minHeight: geometry.size.height)
                .frame(maxWidth: .infinity)
            }
        }
        .sheet(isPresented: $showHistory) {
            HistoryView(showHistory: $showHistory)
        }
        .sheet(isPresented: $showSuccess) {
            SuccessView(selectedTab: $selectedTab)
        }
    }
    
    func resetOrder() {
        showTimer = false
        timerDone = false
        rating = 0
        showRating = false
    }
}

#Preview {
    OrderView(selectedTab: .constant(1), index: 0)
        .environmentObject(OrderHistory())
}
