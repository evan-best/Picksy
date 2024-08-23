//
//  FeaturedAlbum.swift
//  Picksy
//
//  Created by Evan Best on 2024-08-22.
//
import SwiftUI

struct FeaturedAlbum: View {
    @Environment(\.colorScheme) var colorScheme
    var albumTitle: String
    var userName: String
    var userLocation: String
    var description: String
    var profileImage: Image? = nil // Placeholder for the user's profile image

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Button(action: {
                    // Action for user profile picture tap
                    print("Navigate to \(userName)'s profile")
                }) {
                    if let image = profileImage {
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 36, height: 36)
                            .clipShape(Circle())
                    } else {
                        Image(systemName: "person.crop.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 36, height: 36)
                            .foregroundColor(.gray)
                    }
                    Text(userName)
                        .font(.system(size: 17))
                        .fontWeight(.semibold)
                        .padding(.leading, 4)
                        .foregroundColor(colorScheme == .dark ? .white : .black)
                }
                
                Spacer() // Pushes the dots to the far right
                
                Button(action: {
                    // Action for options button tap
                    print("Options tapped")
                }) {
                    Image(systemName: "ellipsis")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                        .foregroundColor(colorScheme == .dark ? .white : .black)
                }
                .padding(.trailing, 4)
            }
            
            Button(action: {
                // Action for album image tap
                print("\(albumTitle) tapped")
            }) {
                Rectangle()
                    .fill(Color.gray)
                    .frame(height: 360) // Larger height to take up most of the screen
                    .cornerRadius(9)
            }
            
            VStack(alignment: .leading, spacing: 4) {
                Text(albumTitle)
                    .font(.system(size: 18))
                    .fontWeight(.bold)
                
                Text(description)
                    .font(.subheadline)
                    .padding(.trailing, 20)
                    .lineLimit(2)
                    .truncationMode(.tail) // Ensures the text is truncated with an ellipsis if too long
                    .foregroundColor(.gray)
                HStack {
                    Image(systemName: "location.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 14, height: 14)
                        .foregroundColor(.gray)
                    Text(userLocation)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .padding(.top, 2)
                
            }
            .padding(.leading, 2)
        }
        .padding(.horizontal, 1)
    }
}

#Preview {
    FeaturedAlbum(albumTitle: "Title", userName: "User Name", userLocation: "St. John's", description: "This is a sample description that is quite long and will be truncated if it is more than 2 lines with of text. Right?")
}
