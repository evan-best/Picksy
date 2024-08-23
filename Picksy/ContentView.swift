import SwiftUI

struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ZStack {
            // Main content
            ExploreView()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            // TabBar overlay
            VStack {
                Spacer() // Pushes the TabBar to the bottom
                TabBar()
            }
            .edgesIgnoringSafeArea(.bottom) // Ensures TabBar ignores safe area
        }
    }
}

#Preview {
    ContentView()
}
