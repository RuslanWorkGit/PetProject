////
////  ReminderPill.swift
////  MedCareTrack
////
////  Created by Ruslan Liulka on 08.01.2024.
////
//
//import SwiftUI
//import Firebase
//import FirebaseFirestoreSwift
//
//struct MedicationReminder: Identifiable, Codable {
//    @DocumentID var id: String?
//    var name: String
//    var dosage: String
//    var time: Date
//}
//
//class MedicationReminderViewModel: ObservableObject {
//    @Published var reminders: [MedicationReminder] = []
//    private var db = Firestore.firestore()
//    
//    func fetchReminders(userId: String) {
//        db.collection("users").document(userId).collection("reminders")
//            .order(by: "time")
//            .addSnapshotListener { (snapshot, error) in
//                if let error = error {
//                    print("Error fetching reminders: \(error)")
//                    return
//                }
//                self.reminders = snapshot?.documents.compactMap {
//                    try? $0.data(as: MedicationReminder.self)
//                } ?? []
//            }
//    }
//    
//    func addReminder(userId: String, name: String, dosage: String, time: Date) {
//        let newReminder = MedicationReminder(name: name, dosage: dosage, time: time)
//        do {
//            _ = try db.collection("users").document(userId).collection("reminders").addDocument(from: newReminder)
//        } catch let error {
//            print("Error adding reminder: \(error)")
//        }
//    }
//}
//
//struct ReminderPillsView: View {
//    @ObservedObject var viewModel = MedicationReminderViewModel()
//    let userId: String
//    
//    var body: some View {
//        VStack {
//            List {
//                ForEach(viewModel.reminders) { reminder in
//                    VStack(alignment: .leading) {
//                        Text(reminder.name).font(.headline)
//                        Text(reminder.dosage).font(.subheadline)
//                        Text(reminder.time, style: .time)
//                    }
//                }
//            }
//            
//            Button("Add Reminder") {
//                // Present add reminder view
//            }
//            .padding()
//            .background(Color.blue)
//            .foregroundColor(.white)
//            .cornerRadius(8)
//        }
//        .onAppear {
//            viewModel.fetchReminders(userId: userId)
//        }
//        .navigationTitle("Medication Reminders")
//    }
//}
//
//struct AddReminderView: View {
//    @ObservedObject var viewModel: MedicationReminderViewModel
//    let userId: String
//    @State private var name: String = ""
//    @State private var dosage: String = ""
//    @State private var time: Date = Date()
//    
//    var body: some View {
//        VStack {
//            TextField("Medication Name", text: $name)
//            TextField("Dosage", text: $dosage)
//            DatePicker("Time", selection: $time)
//            Button("Save") {
//                viewModel.addReminder(userId: userId, name: name, dosage: dosage, time: time)
//            }
//        }
//    }
//}
//
//// Usage of ReminderPillsView in ContentView or somewhere else in the app:
///*
//struct ContentView: View {
//    @StateObject var authViewModel = AuthViewModel()
//
//    var body: some View {
//        // ... other content ...
//        if let user = authViewModel.userSession {
//            ReminderPillsView(userId: user.uid)
//        } else {
//            // Show login or registration view
//        }
//    }
//}
//*/
//
//// Remember to handle user authentication status changes in the main content view.
