//  Main entry point of the app's user interface.
//  This file creates a tab view that allows swiping between screens.

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        // TabView creates a container where each child view becomes a separate page
        // Users can swipe left/right to navigate between pages
        
        TabView {
        
            // First page: Welcome screen (introduces the app)
            
            WelcomeView()
            
            // Creates 4 additional pages (one for each team member)
            // ForEach repeats the OrderView 4 times (index values: 0, 1, 2, 3)
            
            ForEach(0 ..< 4) { index in
                OrderView(index: index)
            }
        }
        
        // PageTabViewStyle makes the tabs appear as full-screen swipeable pages
        // indexDisplayMode: .never hides the default page dots at the bottom
        
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
    }
}

//  Preview provider, shows a live preview in Xcode's canvas

#Preview {
    ContentView()
}
