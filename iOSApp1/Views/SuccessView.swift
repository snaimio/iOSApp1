
//  Order completion screen, coffee cup with sparkles
//  Shows up after the last person (Casey) places their order

import SwiftUI

struct SuccessView: View {
    
    // Dismiss is used to close the sheet when user taps Back to Welcome
    
    @Environment(\.dismiss) var dismiss
    @Binding var selectedTab: Int
    
    var body: some View {
        ZStack {
            VStack(spacing: 25) {
                
                // Coffee cup with sparkles around it, makes it feel celebratory
                // Added three sparkles at different positions and sizes
                
                ZStack {
                    
                    // Main coffee cup icon
                    
                    Image(systemName: "cup.and.saucer.fill")
                        .font(.system(size: 70))
                        .foregroundColor(Color.coffeeBrown)
                    
                    // Sparkle 1, top left (biggest)
                    
                    Image(systemName: "sparkle")
                        .font(.system(size: 22))
                        .foregroundColor(.yellow)
                        .offset(x: -30, y: -35)
                    
                    // Sparkle 2, top right (medium)
                    Image(systemName: "sparkle")
                        .font(.system(size: 16))
                        .foregroundColor(.yellow)
                        .offset(x: 35, y: -25)
                    
                    // Sparkle 3, bottom right (smallest)
                    Image(systemName: "sparkle")
                        .font(.system(size: 14))
                        .foregroundColor(.yellow)
                        .offset(x: 20, y: 35)
                }
                
                Text("All Orders Complete!")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color.coffeeBrown)
                
                Text("Great job team!\nCoffee run successful. ☕️")
                    .font(.body)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                
                // Button to go back to welcome screen
                
                Button(action: {
                    selectedTab = 0   // Go back to welcome page (tab 0)
                    dismiss()        // Close the success sheet
                }) {
                    Text("Back to Welcome")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 200, height: 50)
                        .background(Color.coffeeBrown)
                        .cornerRadius(25)
                }
                .padding(.top, 20)
            }
            .padding()
        }
    }
}

#Preview {
    SuccessView(selectedTab: .constant(0))
}
