
import SwiftUI

struct MainScreen: View {
    // State variables can be added here if needed
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    // Profile header
                    HStack {
                        Image("avatar")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100)
                            
                        VStack(alignment: .leading) {
                            Text("Kyiv, Ukraine")
                                .font(.caption)
                            Text("Hello, John Smith")
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
                        Menu("For doctor speciality") {
                            Button("Option 1", action: {})
                            Button("Option 2", action: {})
                            // Add more buttons for options
                        }
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                        
                        HStack {
                            TextField("What searching?", text: .constant(""))
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
                                    AppointmentCard()
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
                                    MedicationCard()
                                }
                            }
                        }
                    }
                }
                .padding()
            }
            .navigationBarTitle("Home", displayMode: .inline)
            .navigationBarItems(trailing: Image(systemName: "person.crop.circle"))
        }
    }
}

struct AppointmentCard: View {
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

struct MedicationCard: View {
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
    MainScreen()
}
