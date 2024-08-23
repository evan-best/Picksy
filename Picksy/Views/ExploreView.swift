//
//  ExploreView.swift
//  Picksy
//
//  Created by Evan Best on 2024-08-22.
//

import SwiftUI

struct ExploreView: View {
    @Environment(\.colorScheme) var colorScheme
    var profileImage: Image? = nil // Set to `nil` if no image is available
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                // Custom Header
                HStack {
                    // Friends Icon
                    Button(action: {
                        // Action for friends icon
                        print("Friends icon tapped")
                    }) {
                        Image(systemName: "person.2.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 28, height: 28)
                            .padding(.leading)
                            .foregroundColor(colorScheme == .dark ? .white : .black)
                        
                    }
                    
                    Spacer()
                    
                    // Title
                    Text("Picksy")
                        .font(.title2)
                        .fontDesign(.serif)
                        .fontWeight(.bold)
                    
                    Spacer()
                    
                    // Profile Icon
                    Button(action: {
                        // Action for profile icon
                        print("Profile icon tapped")
                    }) {
                        if let image = profileImage {
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(width: 30, height: 30)
                                .clipShape(Circle())
                                .padding(.trailing)
                        } else {
                            Image(systemName: "person.crop.circle.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                                .foregroundColor(colorScheme == .dark ? .white : .black)
                                .padding(.trailing)
                        }
                    }
                }
                .background(Color.clear)
                .padding(.vertical, 10)
                .zIndex(2)
                
                // Scrollable Content
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 20) {
                        // Featured Album
                        ForEach(0..<5) { index in
                            FeaturedAlbum(
                                albumTitle: "Featured Album \(index + 1)",
                                userName: "User \(index + 1)",
                                userLocation: "Location \(index + 1)", description: "This is a very long description that should take more than one line"
                            )
                            .padding(.bottom, 10)
                        }
                        Spacer()
                    }
                    .padding(.horizontal, 2)
                }
            }
            .navigationBarHidden(true)
            .padding(.top, -16)
            .background(Color(UIColor.systemBackground).edgesIgnoringSafeArea(.all))
        }
    }
}

#Preview {
    ExploreView()
}
