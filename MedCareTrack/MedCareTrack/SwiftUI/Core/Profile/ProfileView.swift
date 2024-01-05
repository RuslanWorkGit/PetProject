//
//  ProfileView.swift
//  MedCareTrack
//
//  Created by Ruslan Liulka on 06.01.2024.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        List {
            Section {
                Text("MJ")
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .frame(width: 72, height: 72)
                    .background(Color(.systemGray3))
                    .clipShape(.circle)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("Michael Jordan")
                        .fontWeight(.semibold)
                        .padding(.top, 4)
                    
                    Text("test@gmail.com")
                        .font(.footnote)
                        .accentColor(.gray)
                }
            }
            
            Section("General") {
                
            }
            
            Section("Account") {
                
            }
        }
    }
}

#Preview {
    ProfileView()
}
