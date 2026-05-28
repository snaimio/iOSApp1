import SwiftUI

struct HeaderView: View {
    
    // Binding so this view can change the selected tab in ContentView
    
    @Binding var selectedTab: Int
    let titleText: String
    @Binding var showHistory: Bool
    var showPageNumbers: Bool = true  // Welcome screen doesn't need the circles
    let teamMembers = ["Alex", "Jordan", "Taylor", "Casey"]
    
    var body: some View {
        VStack(spacing: 12) {
            
            // Title at the top, changes color to coffee brown
            
            if showPageNumbers {
                Text(titleText)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.coffeeBrown)
            } else {
                Text("Welcome")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.coffeeBrown)
            }
            
            // Page number circles, tap to jump to any team member
            // Professor used Image(systemName: "\(index).circle") but I used buttons
            // Both work the same way, buttons give me more control
            
            if showPageNumbers {
                HStack(spacing: 20) {
                    ForEach(0..<teamMembers.count, id: \.self) { i in
                        VStack(spacing: 4) {
                            Button(action: {
                                selectedTab = i + 1  // +1 because Welcome is tag 0
                            }) {
                                Text("\(i + 1)")
                                    .font(.title2)
                                    .fontWeight(selectedTab == i + 1 ? .bold : .regular)
                                    .foregroundColor(selectedTab == i + 1 ? Color.coffeeBrown : .gray)
                                    .frame(width: 40, height: 40)
                                    .background(
                                        Circle()
                                            .fill(selectedTab == i + 1 ? Color.coffeeBrown.opacity(0.2) : Color.clear)
                                    )
                            }
                            
                            // Added names below the numbers so users know who is who
                            
                            Text(teamMembers[i])
                                .font(.caption2)
                                .foregroundColor(selectedTab == i + 1 ? Color.coffeeBrown : .gray)
                        }
                    }
                }
            }
        }
        .padding(.vertical, 10)
        .background(Color.white)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    
    // Preview shows Alex's order page (tab 1)
    
    HeaderView(selectedTab: .constant(1), titleText: "Alex's Order", showHistory: .constant(false), showPageNumbers: true)
}
