
//  Main entry point of the app's user interface.
//  Creates a swipeable tab view similar to professor's HIITFit example

import SwiftUI

struct ContentView: View {
    
    // Tracks which page the user is on
    
    @State private var selectedTab = 0
    
    // Creates the data store that will be shared across all views
    // StateObject means this is the owner of the data
    
    @StateObject private var orderHistory = OrderHistory()
    
    var body: some View {
        
        // TabView with swiping between pages
        
        TabView(selection: $selectedTab) {
            
            // First page is the welcome screen (tag 0)
            
            WelcomeView(selectedTab: $selectedTab)
                .tag(0)
            
            // Creates one order screen for each team member (tags 1, 2, 3, 4)
            
            ForEach(OrderHistory.teamMembers.indices, id: \.self) { index in
                OrderView(selectedTab: $selectedTab, index: index)
                    .tag(index + 1)  // +1 because tag 0 is already used by Welcome
            }
        }
        
        // Makes the orderHistory available to all child views
        // This was a bit confusing at first but I understand it now
        
        .environmentObject(orderHistory)
        
        // PageTabViewStyle makes it full screen swipeable, no dots at the bottom
        
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
    }
}

#Preview {
    ContentView()
}
