import SwiftUI

// This view gets called every time the date changes (every second)

struct CountdownView: View {
    let date: Date                    // Current date from TimelineView
    @Binding var timeRemaining: Int     // How many seconds left
    let size: Double                  // Font size for the number
    
    var body: some View {
        Text("\(timeRemaining)")
            .font(.system(size: size, weight: .bold))
            .foregroundColor(Color.coffeeBrown)
        
            // Whenever the date changes, decrease the time remaining by 1
        
            .onChange(of: date) { _, _ in
                if timeRemaining > 0 {
                    timeRemaining -= 1
                }
            }
    }
}

// Main timer view that uses TimelineView, this was tricky to understand at first
// The TimelineView updates every second (minimumInterval: 1.0)
// It pauses automatically when timeRemaining reaches 0

struct TimerView: View {
    @State private var timeRemaining: Int = 3      // 3 second countdown
    @Binding var timerDone: Bool                 // Tell parent when timer is done
    let size: Double
    
    var body: some View {
        TimelineView(
            .animation(
                minimumInterval: 1.0,            // Update every 1 second
                paused: timeRemaining <= 0       // Stop when timer hits zero
            )
        ) { context in
            CountdownView(date: context.date, timeRemaining: $timeRemaining, size: size)
        }
        
        // When timeRemaining changes, check if we're done
        
        .onChange(of: timeRemaining) { _, newValue in
            if newValue < 1 {
                timerDone = true   // Tell OrderView the timer is finished
            }
        }
    }
}

#Preview {
    TimerView(timerDone: .constant(false), size: 50)
}
