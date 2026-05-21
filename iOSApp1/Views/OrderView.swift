//  The main ordering screen, one for each team member.
//  Shows the team member's name, drink options, coffee related images
//  a static timer message, and placeholder buttons.
//

import SwiftUI

struct OrderView: View {
    
    // Array of team member names, matches the 4 people in the coffee run
    // OrderView is created 4 times, once per person (index 0,1,2,3)
    
    let teamNames = ["Alex", "Jordan", "Taylor", "Casey"]
    
    // The index passed from ContentView's ForEach (0, 1, 2, or 3)
    // Determines which team member's name to display
    
    let index: Int
    
    var body: some View {
        
        // VStack arranges all child views vertically (top to bottom)
        
        VStack {
            
            // HeaderView is a reusable component that shows the member's name
            // Example: when index=0, memberName becomes "Alex's Order"
            
            HeaderView(memberName: "\(teamNames[index])'s Order")
            
            // Spacer pushes content apart, creates flexible empty space
            // This one pushes everything below it toward the bottom
            
            Spacer()
            
            // Large coffee cup image (filled version of the SF Symbol)
            // The .fill version creates a solid icon instead of an outline
            
            Image(systemName: "cup.and.saucer.fill")
                .font(.system(size: 80))    //  Custom size (80 points)
                .foregroundColor(.brown)    //  Coffee theme color
                .padding()                //    Adds space around the image
            
            // Static text for drink selection (not interactive yet)
            // In a future version, this could be a Picker or Menu
            
            Text("Select your drink: Coffee")
                .font(.headline)    // Bold, medium size
            
            // Static text for size selection (not interactive yet)
            
            Text("Select size: Medium")
                .font(.subheadline)            // Smaller than headline
                .padding(.bottom)              // Adds space below this text
            
            // Label combines an icon (stopwatch) and text
            // No actual timer functionality, just a placeholder for now
            
            Label("Coffee ready in: 2-3 minutes", systemImage: "stopwatch")
                .font(.system(size: 14))       // Small custom font size
                .foregroundColor(.gray)        // Subtle gray color
            
            Spacer()
            
            // Placeholder for the "Place Order" button
            // Currently just static text styled as a button
            // In a complete app, this would be a Button with an action
            
            Text("Place Order")
                .font(.headline)
                .foregroundColor(.white)        // White text on brown background
                .frame(width: 250, height: 50)  // Fixed width and height
                .background(Color.brown)        // Brown background (coffee theme)
                .cornerRadius(10)               // Rounded corners (pill shape)
            
            // Placeholder for the "View Past Orders" button
            // Currently just static text, no action yet
            
            Text("View Past Orders")
                .foregroundColor(.brown)        // Brown text (no background)
                .padding(.top, 5)              // Extra space on top only
            
        }
        
        // Adds extra padding only at the bottom of the entire VStack
        // This prevents content from touching the bottom edge of the screen
        
        .padding(.bottom, 40)
    }
}

// Preview, shows the first team member (Alex) in Xcode's canvas
#Preview {
    OrderView(index: 0)
}
