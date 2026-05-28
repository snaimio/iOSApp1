import SwiftUI

struct HistoryView: View {
    @Binding var showHistory: Bool
    @EnvironmentObject var orderHistory: OrderHistory  // Shared data from ContentView
    
    var body: some View {
        NavigationView {
            Group {
                
                // Shows empty state if no orders yet
                
                if orderHistory.orderDays.isEmpty {
                    VStack(spacing: 20) {
                        Image(systemName: "clock.arrow.circlepath")
                            .font(.system(size: 60))
                            .foregroundColor(.gray)
                        Text("No orders yet")
                            .font(.title2)
                            .foregroundColor(.gray)
                        Text("Place your first order to see history here")
                            .font(.body)
                            .foregroundColor(.gray)
                    }
                } else {
                    
                    // List with sections for each day, like professor's Form but List works better here
                    
                    List {
                        ForEach(orderHistory.orderDays) { day in
                            
                            // Each day gets its own section header with the date
                            
                            Section(header: Text(formatDate(day.date))) {
                                ForEach(day.orders, id: \.id) { order in
                                    VStack(alignment: .leading, spacing: 6) {
                                        HStack {
                                            Text(order.teamMemberName)
                                                .font(.headline)
                                                .foregroundColor(Color.coffeeBrown)
                                            Spacer()
                                            
                                            // Shows rating as coffee cups instead of stars
                                            // Thought this was more fun for a coffee app
                                            
                                            HStack(spacing: 3) {
                                                ForEach(1...5, id: \.self) { i in
                                                    Image(systemName: i <= order.rating ? "cup.and.saucer.fill" : "cup.and.saucer")
                                                        .font(.caption)
                                                        .foregroundColor(i <= order.rating ? Color.coffeeBrown : .gray)
                                                }
                                            }
                                        }
                                        Text(order.drinkName)
                                            .font(.subheadline)
                                        Text("\(order.size) • Sugar: \(order.sugar) • Milk: \(order.milk)")
                                            .font(.caption)
                                            .foregroundColor(.secondary)
                                    }
                                    .padding(.vertical, 4)
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("Order History")
            .toolbar {
                
                // Close button to dismiss the sheet
                
                Button("Close") {
                    showHistory = false
                }
            }
        }
    }
    
    // Helper function to format dates nicely: e.g. "Monday, May 28"
    
    func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, MMM d"
        return formatter.string(from: date)
    }
}

#Preview {
    HistoryView(showHistory: .constant(true))
        .environmentObject(OrderHistory())
}
