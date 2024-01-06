

import SwiftUI

struct RegistrationView: View {
    @State private var email = ""
    @State private var fullname = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @Environment(\.dismiss) var dissmis
    @EnvironmentObject var viewModel: AuthViewModel

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
                
                InputView(text: $fullname, title: "Full name", placeHolder: "Enter your name")
                    .textInputAutocapitalization(.none)
                
                InputView(text: $password,
                          title: "Password",
                          placeHolder: "Enter your password",
                          isSecureField: true)
                
                ZStack(alignment: .trailing) {
                    InputView(text: $confirmPassword,
                              title: "Confirm Password",
                              placeHolder: "Enter your password",
                              isSecureField: true)
                    
                    if !password.isEmpty && !confirmPassword.isEmpty { // check the password
                        if password == confirmPassword {
                            Image(systemName: "checkmark.circle.fill")
                                .imageScale(.large)
                                .fontWeight(.bold)
                                .foregroundColor(Color(.systemGreen))
                        } else {
                            Image(systemName: "xmark.circle.fill")
                                .imageScale(.large)
                                .fontWeight(.bold)
                                .foregroundStyle(Color(.systemRed))
                        }
                    }
                }
                          
            }
            .padding(.horizontal)
            .padding(.top, 12)
            
            Button(action: {
                Task {
                    try await viewModel.createUser(withEmail: email,
                                                   password: password,
                                                   fullName: fullname)
                }
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
            .disabled(!formIsValid)
            .opacity(formIsValid ? 1.0 : 0.5)
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

//MARK: - AuthenticationFormProtocol

extension RegistrationView: AuthenticationFormProtocol {
    var formIsValid: Bool {
        return !email.isEmpty
        && email.contains("@")
        && !password.isEmpty
        && password.count > 5
        && confirmPassword == password
        && !fullname.isEmpty
    }
}

#Preview {
    RegistrationView()
}
