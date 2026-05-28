import SwiftUI

extension Image {
    
    //  Makes images resizable and fills the frame
    //  Used this for the coffee cup icons and success screen images
    //  Keeps the image from looking stretched or distorted
    
    func resizedToFill(width: CGFloat, height: CGFloat) -> some View {
        self
            .resizable()                            // Make it resizable so I can change size
            .aspectRatio(contentMode: .fill)          // Fills the frame without squishing
            .frame(width: width, height: height)    // Sets exact dimensions
    }
}
