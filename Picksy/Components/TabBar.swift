import SwiftUI

struct TabBar: View {
    @State private var selectedTab: Int = 0
    @State var screenSize = UIScreen.main.bounds.size

    var body: some View {
        VStack(spacing: 0) {
            // Content View based on selectedTab
            ZStack {
                switch selectedTab {
                case 0:
                    ExploreView()
                case 1:
                    InboxView()
                case 2:
                    CameraView()
                case 3:
                    AlbumsView()
                case 4:
                    ProfileView()
                default:
                    ExploreView()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)

            // Custom TabBar
            ZStack(alignment: .topLeading) {
                // Active Bar
                Rectangle()
                    .frame(width: screenSize.width / 5, height: 4)
                    .foregroundColor(.white)
                    .offset(x: CGFloat(selectedTab) * (screenSize.width / 5))
                    .animation(.easeInOut(duration: 0.3), value: selectedTab)

                // Icon Section
                HStack(alignment: .center) {
                    // Explore Tab
                    Button(action: {
                        selectedTab = 0
                        print("Explore tapped")
                    }) {
                        Image(systemName: "house.fill")
                            .font(.system(size: 25))
                            .frame(maxWidth: .infinity)
                    }
                    .foregroundColor(selectedTab == 0 ? .white : .gray)

                    // Inbox Tab
                    Button(action: {
                        selectedTab = 1
                        print("Inbox tapped")
                    }) {
                        Image(systemName: "tray.fill")
                            .font(.system(size: 25))
                            .frame(maxWidth: .infinity)
                    }
                    .foregroundColor(selectedTab == 1 ? .white : .gray)

                    // Camera Tab
                    Button(action: {
                        selectedTab = 2
                        print("Camera tapped")
                    }) {
                        Image(systemName: "camera.fill")
                            .font(.system(size: 25))
                            .frame(maxWidth: .infinity)
                            .foregroundColor(selectedTab == 2 ? .white : .gray)
                    }

                    // Albums Tab
                    Button(action: {
                        selectedTab = 3
                        print("Albums tapped")
                    }) {
                        Image(systemName: "photo.on.rectangle.fill")
                            .font(.system(size: 25))
                            .frame(maxWidth: .infinity)
                    }
                    .foregroundColor(selectedTab == 3 ? .white : .gray)

                    // Profile Tab
                    Button(action: {
                        selectedTab = 4
                        print("Profile tapped")
                    }) {
                        Image(systemName: "person.fill")
                            .font(.system(size: 25))
                            .frame(maxWidth: .infinity)
                    }
                    .foregroundColor(selectedTab == 4 ? .white : .gray)
                }
                .padding(.top, 14)
                .padding(.bottom, 16)
            }
            .background(Color(UIColor.systemBackground))
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

#Preview {
    TabBar()
}
