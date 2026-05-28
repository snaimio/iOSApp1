import SwiftUI

struct RatingView: View {
    
    // Binding so the rating value updates in the parent view (OrderView)
    
    @Binding var rating: Int
    
    let maximumRating = 5
    let onColor = Color.coffeeBrown     // Filled cups use our coffee brown color
    let offColor = Color.gray          // Empty cups are gray
    
    var body: some View {
        HStack(spacing: 12) {
            
            // Loop 5 times to create 5 coffee cup icons
            
            ForEach(1..<maximumRating + 1, id: \.self) { index in
                
                // Filled cup if index is less than or equal to current rating
                // Empty cup outline if not rated yet
                
                Image(systemName: index <= rating ? "cup.and.saucer.fill" : "cup.and.saucer")
                    .foregroundColor(index <= rating ? onColor : offColor)
                    .onTapGesture {
                        rating = index   // Set rating when user taps a cup
                    }
            }
        }
        .font(.title)  // Makes the cups a good size for tapping
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    RatingView(rating: .constant(3))
}
