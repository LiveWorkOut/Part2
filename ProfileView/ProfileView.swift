//
//  ProfileView.swift
//  login view
//
//  Created by Abraham Estrada on 4/20/24.
//

import SwiftUI

struct ProfileView: View {
    
    
    var body: some View {
        VStack {
            VStack {
                Text("👨‍💼")
                    .font(.system(size: 70))
                Text("John Doe")
                    .font(.system(size: 52, weight: .bold))
                Text("Bio goes here...")
                    .font(.system(size: 24))
            }
            .padding()
            Spacer()
            // TODO: - Do a for each here for each of their workouts with a workout view
            RoundedRectangle(cornerRadius: 12.0)
                .padding()
            RoundedRectangle(cornerRadius: 12.0)
                .padding()
            RoundedRectangle(cornerRadius: 12.0)
                .padding()
        }
    }
}

#Preview {
    ProfileView()
}
