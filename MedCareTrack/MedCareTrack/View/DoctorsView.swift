
import SwiftUI

struct DoctorsView: View {
    // State variable for the search text
    @State private var searchText = ""
    @State private var isToggleOn = false

    var body: some View {
        VStack(spacing: 24) {
            // Search bar
            HStack {
                TextField("Search for speciality", text: $searchText)
                    .padding(7)
                    .padding(.horizontal, 25)
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    .overlay(
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.gray)
                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                .padding(.leading, 8)
                            
                            if !searchText.isEmpty {
                                Button(action: {
                                    self.searchText = ""
                                }) {
                                    Image(systemName: "multiply.circle.fill")
                                        .foregroundColor(.gray)
                                        .padding(.trailing, 8)
                                }
                            }
                        }
                    )
                Button(action: {
                    // action to show filters
                }) {
                    Image(systemName: "slider.horizontal.3")
                }
            }
            .padding(.horizontal)
            
            
            // Date and sorting options
            HStack {
                Text("Today, Sat. 03-06-23")
                    .font(.subheadline)
                Spacer()
                Button(action: {
                    // action for list view
                }) {
                    Image(systemName: "list.bullet")
                }
                Button(action: {
                    // action for grid view
                }) {
                    Image(systemName: "square.grid.2x2")
                }
            }
            .padding(.horizontal)
            
            // Toggle for showing doctors available on this day
            Toggle(isOn: $isToggleOn) {
                Text("Show doctors only available on this day")
            }
        
            .padding(.horizontal)
            
            // List of doctors
            List {
                ForEach(0..<10) { _ in
                    DoctorCell()
                }
            }

        }
        .navigationBarTitle("Doctors", displayMode: .inline)
        .navigationBarItems(trailing: Image(systemName: "map"))
    }
}

struct DoctorCell: View {
    var body: some View {
        Group {
            HStack {
                Image(systemName: "person.crop.rectangle")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .padding(.trailing, 10)
                
                VStack(alignment: .leading, spacing: 2) {
                    Text("Dr. Anatoly Levinskiy")
                        .font(.headline)
                    Text("Cardiologist")
                        .font(.subheadline)
                    Text("Experience: 8 years")
                        .font(.caption)
                    Text("Medical Center EasyCare")
                        .font(.caption)
                    HStack {
                        ForEach(0..<5) { _ in
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                        }
                    }
                    Text("500 m")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                
                Spacer()
                
                VStack(alignment: .trailing) {
                    Text("100 $")
                        .font(.headline)
                    Button(action: {
                        // action to book an appointment
                    }) {
                        Text("Book")
                            .font(.caption)
                            .foregroundColor(.blue)
                    }
                }
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray, lineWidth: 1))
        }
    }
}


#Preview {
   DoctorsView()
}
