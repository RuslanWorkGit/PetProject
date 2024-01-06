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
                Text(User.MOCK_USER.initials)
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .frame(width: 72, height: 72)
                    .background(Color(.systemGray3))
                    .clipShape(.circle)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(User.MOCK_USER.fullName)
                        .fontWeight(.semibold)
                        .padding(.top, 4)
                    
                    Text(User.MOCK_USER.email)
                        .font(.footnote)
                        .accentColor(.gray)
                }
            }
            
            Section("General") {
                
                HStack {
                    SettingsRowView(imageName: "gear", title: "Version", tintColor: Color(.systemGray))
                    
                    Spacer()
                    
                    Text("1.0.0")
                        .font(.headline)
                        .foregroundStyle(.gray)
                }
                
                
            }
            
            Section("Account") {
                Button(action: {
                    print("Sign out..")
                }, label: {
                    SettingsRowView(imageName: "arrow.left.circle.fill", title: "Sign out", tintColor: .red)
                })
                
                Button(action: {
                    print("Sign out..")
                }, label: {
                    SettingsRowView(imageName: "xmark.circle.fill", title: "Delet account", tintColor: .red)
                })
            }
        }
    }
}

#Preview {
    ProfileView()
}
