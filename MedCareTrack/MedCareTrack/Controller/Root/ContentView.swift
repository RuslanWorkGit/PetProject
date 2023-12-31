//
//  ContentView.swift
//  MedCareTrack
//
//  Created by Ruslan Liulka on 06.01.2024.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @StateObject var authViewModel = AuthViewModel()
    
    var body: some View {
        Group {
            if viewModel.userSession != nil {
                //ProfileView()
                //MainScreenMenu()
                HomeScreenMenu()
            } else {
                LoginView()
            }
            
        }
    }
}

#Preview {
    ContentView()
}
