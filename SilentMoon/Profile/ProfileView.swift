//
//  ProfileView.swift
//  SilentMoon
//
//  Created by Yaroslav Orlov on 13.06.2023.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack {
          Image("4")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 120, height: 120)
                .clipShape(Circle())
                .padding(.top, 40)
            
            Text("John Doe")
                .font(.title)
                .fontWeight(.bold)
                .padding(.top, 20)
            
            Text("Meditation Enthusiast")
                .font(.subheadline)
                .foregroundColor(.gray)
                .padding(.top, 5)
            
            Spacer()
            
            VStack(spacing: 20) {
                ProfileInfoRow(title: "Age", value: "30")
                ProfileInfoRow(title: "Location", value: "New York")
                ProfileInfoRow(title: "Experience", value: "3 years")
                ProfileInfoRow(title: "Sessions Completed", value: "150")
            }
            .padding(.vertical, 30)
            
            Spacer()
        }
        .padding(.horizontal, 20)
    }
}

struct ProfileInfoRow: View {
    var title: String
    var value: String
    
    var body: some View {
        HStack {
            Text(title)
                .font(.headline)
            
            Spacer()
            
            Text(value)
                .font(.subheadline)
                .foregroundColor(.gray)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
