
import SwiftUI

struct HomeScreenMenu: View {
    var body: some View {
        TabView {
            MainView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            DoctorsView()
                .tabItem {
                    Label("Doctors", systemImage: "stethoscope")
                }
            
            MainMetricView()
                .tabItem {
                    Label("Watch", systemImage: "applewatch")
                }
            
            FunctionalView()
                .tabItem {
                    Label("Functional", systemImage: "message")
                }
            
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.crop.circle")
                }
        }
    }
}

struct MainView: View {
    // State variables can be added here if needed
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        if let user = viewModel.currentUser {
            NavigationView {
                ScrollView {
                    VStack(alignment: .leading, spacing: 10) {
                        // Profile header
                        HStack {
                            Image("avatar")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100)
                                .clipShape(.circle)
                                
                            VStack(alignment: .leading) {
                                Text("Kyiv, Ukraine")
                                    .font(.caption)
                                Text("Hello, \(user.fullName)")
                                    .font(.title2).bold()
                                Text("How are you feeling today?")
                                    .font(.subheadline)
                            }
                            Spacer()
                            Image(systemName: "bell")
                                .padding()
                        }
                        
                        // Search area
                        Group {
                            Text("Select search type")
                                .font(.headline)
                            Menu("Doctor specialist") {
                                Button("Therapist", action: {})
                                Button("Dentist", action: {})
                                Button("Eye specialist", action: {})
                                Button("Surgeon", action: {})
                                Button("Ophthalmologist", action: {})
                                // Add more buttons for options
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(Color.white)
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.gray, lineWidth: 1)
                            )
                            
                            Text("Specialist you search")
                                .font(.headline)
                            HStack {
                                TextField("ex. Dentist", text: .constant(""))
                                Image(systemName: "magnifyingglass")
                            }
                            
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.gray, lineWidth: 1)
                            )
                        }
                        
                        // Upcoming appointments
                        Group {
                            HStack {
                                Text("Upcoming appointments")
                                    .font(.headline)
                                Spacer()
                                Button("See all", action: {})
                            }
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 10) {
                                    // Appointment card
                                    ForEach(0..<5) { _ in
                                        AppointmentCardView()
                                    }
                                }
                            }
                        }
                        
                        // Upcoming medication
                        Group {
                            HStack {
                                Text("Upcoming medication")
                                    .font(.headline)
                                Spacer()
                                Button("See all", action: {})
                            }
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 10) {
                                    // Medication card
                                    ForEach(0..<5) { _ in
                                        MedicationCardView()
                                    }
                                }
                            }
                        }
                    }
                    .padding()
                }
                .navigationBarTitle("Home", displayMode: .inline)
    //            .navigationBarItems(trailing: Image(systemName: "person.crop.circle"))
                .navigationBarItems(trailing: NavigationLink(destination: ProfileView()) {
                    Image(systemName: "person.crop.circle")
                })
            }
        }
    }
}

struct AppointmentCardView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "waveform.path.ecg")
                    .foregroundColor(.blue)
                VStack(alignment: .leading) {
                    Text("Dr. Dmitry Levchenko")
                        .bold()
                    Text("Dentist")
                    Text("Stomatology EasyDoc")
                }
            }
            HStack {
                Image(systemName: "calendar")
                Text("16 November")
                Spacer()
                Image(systemName: "clock")
                Text("9:30")
            }
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray, lineWidth: 1))
    }
}

struct MedicationCardView: View {
    var body: some View {
        HStack {
            Image(systemName: "pills")
                .foregroundColor(.red)
            VStack(alignment: .leading) {
                Text("Lisinopril")
                Text("1 pill, 100 mg")
                Text("After breakfast")
            }
            Spacer()
            VStack(alignment: .leading) {
                Text("Start: 16.08.2023")
                Text("4 days left")
            }
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray, lineWidth: 1))
    }
}

#Preview {
    HomeScreenMenu()
}
