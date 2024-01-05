//
//  RegistrationView.swift
//  MedCareTrack
//
//  Created by Ruslan Liulka on 06.01.2024.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email = ""
    @State private var fullname = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @Environment(\.dismiss) var dissmis

    var body: some View {
        VStack {
            //image
            Image("med-logo")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
                .padding(.vertical, 32)
            
            VStack(spacing: 24) {
                InputView(text: $email, title: "Email Address", placeHolder: "name@example.com")
                    .textInputAutocapitalization(.none)
                
                InputView(text: $email, title: "Full name", placeHolder: "Enter your name")
                    .textInputAutocapitalization(.none)
                
                InputView(text: $password,
                          title: "Password",
                          placeHolder: "Enter your password",
                          isSecureField: true)
                
                InputView(text: $password,
                          title: "Confirm Password",
                          placeHolder: "Enter your password",
                          isSecureField: true)
                          
            }
            .padding(.horizontal)
            .padding(.top, 12)
            
            Button(action: {
                print("Sing user up..")
            }, label: {
                HStack {
                    Text("SING UP")
                        .fontWeight(.semibold)
                    Image(systemName: "arrow.right")
                }
                .foregroundStyle(.white)
                .frame(width: UIScreen.main.bounds.width - 32, height: 48)
            })
            .background(Color(.systemBlue))
            .cornerRadius(10)
            .padding(.top, 24)
            
            
            Spacer()
            
            Button(action: {
                dissmis()
            }, label: {
                HStack(spacing: 3){
                    Text("Already have an account?")
                    Text("Sing up")
                        .fontWeight(.bold)
                }
                .font(.system(size: 14))
            })
            
        }
    }
}

#Preview {
    RegistrationView()
}
