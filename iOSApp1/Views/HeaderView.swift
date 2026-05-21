//  Reusable header that appears at the top of each order screen.
//  Displays four coffee-themed icons (SF Symbols) and the team member's name.

import SwiftUI

struct HeaderView: View {
    
    // Property that stores the name of the current team member (e.g., "Alex's Order")
    // This value is passed in when HeaderView is created
    
    let memberName: String
    var body: some View {
        
        // VStack arranges views vertically (top to bottom)
        
        VStack {
            
            // HStack arranges views horizontally (left to right)
            
            HStack {
                
                // Four SF Symbol images representing coffee/breakfast theme
                
                Image(systemName: "cup.and.saucer")
                Image(systemName: "takeoutbag.and.cup.and.straw")
                Image(systemName: "birthday.cake")
                Image(systemName: "mug")
            }
            
            // Applys modifiers to the entire HStack
            
            .font(.title2)
            .foregroundColor(.brown)
            
            // Displays the team member's name (e.g., "Alex's Order")
            
            Text(memberName)
                .font(.largeTitle)
        }
        .padding()
    }
}

//  Preview with a sample member name
//  .sizeThatFitsLayout makes preview fit content size

#Preview(traits: .sizeThatFitsLayout) {
    HeaderView(memberName: "Alex's Order")
}
