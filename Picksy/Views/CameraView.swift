import SwiftUI

struct CameraView: View {
    var body: some View {
        ZStack {
            GeometryReader { geometry in
                if isPreview() {
                    Image("camera_preview_placeholder")
                        .resizable()
                        .scaledToFill()
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .edgesIgnoringSafeArea(.all)
                } else {
                    CameraFeedView()
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .edgesIgnoringSafeArea(.all)
                }
                
                VStack {
                    HStack {
                        Button(action: {
                            // Capture photo or perform another action
                        }) {
                            Image(systemName: "camera.circle")
                                .resizable()
                                .frame(width: 70, height: 70)
                                .foregroundColor(.white)
                        }
                        .position(x: geometry.size.width / 2, y: geometry.size.height - 80)
                    }
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    // Helper function to check if the code is running in the preview
    private func isPreview() -> Bool {
        return ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] == "1"
    }
}

// Mock view to represent the camera feed during runtime
struct CameraFeedView: View {
    var body: some View {
        Color.black // Placeholder during development
    }
}

#Preview {
    CameraView()
}
