import SwiftUI

struct WelcomeView: View {
    @Binding var selectedTab: Int
    @State private var showHistory = false
    @EnvironmentObject var orderHistory: OrderHistory
    
    var body: some View {
        VStack(spacing: 20) {
            
            // Header without page numbers (showPageNumbers: false)
          
            HeaderView(selectedTab: $selectedTab, titleText: "Welcome", showHistory: $showHistory, showPageNumbers: false)
            
            Spacer()
            
            // Large coffee cup icon, the main visual element
            
            Image(systemName: "cup.and.saucer.fill")
                .font(.system(size: 80))
                .foregroundColor(Color.coffeeBrown)
            
            // App title
            
            Text("Team Coffee Run")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(Color.coffeeBrown)
            
            // Tagline
            
            Text("Order together, save time")
                .font(.title3)
                .foregroundColor(.gray)
            
            Spacer()
            
            // Get Started button, takes user to Alex's order screen (tab 1)
  
            Button(action: { selectedTab = 1 }) {
                HStack {
                    Text("Get Started")
                    Image(systemName: "arrow.right.circle")
                }
                .font(.title2)
                .foregroundColor(.white)
                .padding(.horizontal, 30)
                .padding(.vertical, 12)
                .background(Color.coffeeBrown)
                .cornerRadius(25)
            }
            
            // History button, opens the history view as a sheet
         
            Button(action: { showHistory.toggle() }) {
                HStack {
                    Image(systemName: "clock")
                    Text("Order History")
                }
                .font(.body)
                .foregroundColor(Color.coffeeBrown)
                .padding(.top, 10)
            }
            
            Spacer()
                .frame(height: 40)
        }
        .sheet(isPresented: $showHistory) {
            HistoryView(showHistory: $showHistory)
        }
    }
}

#Preview {
    WelcomeView(selectedTab: .constant(0))
        .environmentObject(OrderHistory())
}
