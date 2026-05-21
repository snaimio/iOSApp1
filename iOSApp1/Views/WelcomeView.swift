//  The first screen users see when the app launches.
//  Introduces the coffee run app and explains how to start ordering.

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        
        // VStack arranges views vertically (top to bottom)
        // (spacing: 20) adds 20 points of space between each child view
        
        VStack(spacing: 20) {

            // Large coffee cup image (filled SF Symbol)
            // This is the main visual element of the welcome screen
            
            Image(systemName: "cup.and.saucer.fill")
                .font(.system(size: 80))    // Custom size, large but not overwhelming
                .foregroundColor(.brown)    // Coffee theme color
            
            // Main welcome title, warm and inviting
            
            Text("Welcome to Team Coffee Run!")
                .font(.largeTitle)              // Very large, bold font
                .multilineTextAlignment(.center)  // Centers text if it wraps to multiple lines
                .padding()                     // Adds space around the text (all sides)
            
            // Instruction text – tells user how to navigate
            // The ← is a Unicode left arrow (simple, no extra image needed)
            // ☕️ is a coffee emoji for visual appeal
            
            Text("← Swipe left to start ordering ☕️")
                .font(.title3)          // Medium-large font (smaller than title)
                .foregroundColor(.gray)  // Subtle gray, less emphasis than main title
            
            // Reassures user that each team member has their own page
            
            Text("Each team member has their own order screen")
                .font(.body)                  // Standard reading font
                .foregroundColor(.secondary)    // System gray (adapts to light/dark mode)
                .padding(.top)                // Extra space only at the top
        }
        .padding()        // Adds padding around the entire VStack (space between content and screen edges)
    }
}

// Preview, shows the welcome screen in Xcode's canvas

#Preview {
    WelcomeView()
}
