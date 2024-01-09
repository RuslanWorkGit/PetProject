

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        NavigationStack {
            VStack {
                //image
                Image("med-logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200)
                    .padding(.vertical, 32)
                
                //form fields
                VStack(spacing: 24) {
                    InputView(text: $email, title: "Email Address", placeHolder: "name@example.com")
                        .textInputAutocapitalization(.none)
                    
                    InputView(text: $password,
                              title: "Password",
                              placeHolder: "Enter your password",
                              isSecureField: true)
                }
                .padding(.horizontal)
                .padding(.top, 12)
                
                //sing in button
                Button(action: {
                    Task {
                        try await viewModel.singIn(withEmail: email, password: password)
                    }
                }, label: {
                    HStack {
                        Text("SING IN")
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
                
                //sing up button
                
                NavigationLink(
                    destination: {
                        RegistrationView()
                            .navigationBarBackButtonHidden(true)
                    },
                    label: {
                        HStack(spacing: 3){
                            Text("Don't have an account?")
                            Text("Sing up")
                                .fontWeight(.bold)
                        }
                        .font(.system(size: 14))
                })
            }
        }
    }
}

//MARK: - AuthenticationFormProtocol

extension LoginView: AuthenticationFormProtocol {
    var formIsValid: Bool {
        return !email.isEmpty
        && email.contains("@")
        && !password.isEmpty
        && password.count > 5
    }
}

#Preview {
    LoginView()
}
