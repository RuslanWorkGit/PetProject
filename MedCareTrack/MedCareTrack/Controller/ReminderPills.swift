//
//import SwiftUI
//import Firebase
//
//struct MedicationReminder: Identifiable {
//    let id: String
//    let name: String
//    let dosage: String
//    let time: Date
//}
//
//class MedicationReminderViewModel: ObservableObject {
//    @Published var reminders: [MedicationReminder] = []
//    
//    func addReminder(name: String, dosage: String, time: Date) {
//        let newReminder = MedicationReminder(id: UUID().uuidString, name: name, dosage: dosage, time: time)
//        
//        // Add the new reminder to Firebase
//        let db = Firestore.firestore()
//        db.collection("reminders").document(newReminder.id).setData([
//            "name": name,
//            "dosage": dosage,
//            "time": time
//        ]) { error in
//            if let error = error {
//                print("Error adding reminder: \(error.localizedDescription)")
//            } else {
//                self.fetchReminders()
//            }
//        }
//    }
//    
//    func fetchReminders() {
//        let db = Firestore.firestore()
//        db.collection("reminders").getDocuments { (querySnapshot, error) in
//            if let error = error {
//                print("Error getting reminders: \(error.localizedDescription)")
//            } else {
//                self.reminders = querySnapshot?.documents.compactMap { document -> MedicationReminder? in
//                    let data = document.data()
//                    let id = document.documentID
//                    let name = data["name"] as? String ?? ""
//                    let dosage = data["dosage"] as? String ?? ""
//                    let timestamp: Timestamp = data["time"] as? Timestamp ?? Timestamp(date: Date())
//                    let time = timestamp.dateValue()
//                    return MedicationReminder(id: id, name: name, dosage: dosage, time: time)
//                } ?? []
//            }
//        }
//    }
//}
//
//struct ReminderPillsView: View {
//    @ObservedObject var viewModel = MedicationReminderViewModel()
//    @State private var showingAddReminderSheet = false
//    
//    var body: some View {
//        VStack {
//            List {
//                ForEach(viewModel.reminders) { reminder in
//                    HStack {
//                        VStack(alignment: .leading) {
//                            Text(reminder.name).font(.headline)
//                            Text(reminder.dosage).font(.subheadline)
//                        }
//                        Spacer()
//                        Text(reminder.time, style: .time)
//                    }
//                }
//            }
//            
//            Button("Додати Нагадування") {
//                showingAddReminderSheet = true
//            }
//            .padding()
//            .background(Color.blue)
//            .foregroundColor(.white)
//            .cornerRadius(8)
//        }
//        .sheet(isPresented: $showingAddReminderSheet) {
//            AddReminderSheet(viewModel: viewModel)
//        }
//        .onAppear {
//            viewModel.fetchReminders()
//        }
//        .navigationTitle("Нагадування прийому ліків")
//    }
//}
//
//struct AddReminderSheet: View {
//    @ObservedObject var viewModel: MedicationReminderViewModel
//    @State private var medicationName: String = ""
//    @State private var dosage: String = ""
//    @State private var time: Date = Date()
//    @Environment(\.presentationMode) var presentationMode
//    
//    var body: some View {
//        NavigationView {
//            Form {
//                TextField("Назва ліків", text: $medicationName)
//                TextField("Дозування", text: $dosage)
//                DatePicker("Час", selection: $time)
//                
//                Button("Зберегти Нагадування") {
//                    viewModel.addReminder(name: medicationName, dosage: dosage, time: time)
//                    presentationMode.wrappedValue.dismiss()
//                }
//            }
//            .navigationBarTitle("Нове Нагадування", displayMode: .inline)
//            .navigationBarItems(trailing: Button("Закрити") {
//                presentationMode.wrappedValue.dismiss()
//            })
//        }
//    }
//}
//
