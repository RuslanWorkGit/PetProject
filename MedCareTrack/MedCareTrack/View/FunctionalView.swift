//
//  FunctionalView.swift
//  MedCareTrack
//
//  Created by Ruslan Liulka on 07.01.2024.
//

import SwiftUI

struct FunctionalView: View {
    @EnvironmentObject var viewModel: AuthViewModel

    var body: some View {
        NavigationView {
            List {
                Group {
                    if let userSession = viewModel.userSession {
                        let reminderViewModel = MedicationReminderViewModel(userSession: userSession)
                        NavigationLink(destination: ReminderPillsView(viewModel: reminderViewModel)) {
                            SettingsRowView(imageName: "pills.circle.fill", title: "Встановити нагадування прийому ліків", tintColor: .green)
                                                }
                        
                    }
                    
//                    NavigationLink(destination: ReminderPillsView(viewModel: <#T##MedicationReminderViewModel#>, showingAddReminderSheet: <#T##arg#>)) {
//                        SettingsRowView(imageName: "pills.circle.fill", title: "Встановити нагадування прийому ліків", tintColor: .green)
//                    }
                    
                    NavigationLink(destination: MainMetricView()) {
                        SettingsRowView(imageName: "clock.badge.checkmark.fill", title: "Моніторинг стану здоровʼя", tintColor: .yellow)
                    }
                    
                    Button(action: {
                        print("Ведення медичного щоденника")
                    }, label: {
                        SettingsRowView(imageName: "heart.text.square.fill", title: "Ведення медичного щоденника", tintColor: .blue)
                    })
                    
                    Button(action: {
                        print("Віртуальна консультація з лікарем")
                    }, label: {
                        SettingsRowView(imageName: "video.fill.badge.checkmark", title: "Віртуальна консультація з лікарем", tintColor: .purple)
                    })
                    
                    Button(action: {
                        print("Інформаційна база")
                    }, label: {
                        SettingsRowView(imageName: "server.rack", title: "Інформаційна база", tintColor: .orange)
                    })
                    
                    Button(action: {
                        print("Менеджер вакцинації")
                    }, label: {
                        SettingsRowView(imageName: "medical.thermometer.fill", title: "Менеджер вакцинації", tintColor: .pink)
                    })
                    
                    Button(action: {
                        print("Результати лабороторії")
                    }, label: {
                        SettingsRowView(imageName: "testtube.2", title: "Результати лабороторії", tintColor: .green)
                    })
                }
                .padding(10)
            }
            .listStyle(GroupedListStyle())
            .navigationTitle("Доступний функціонал") // Замініть цей рядок
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Доступний функціонал")
                        .font(.system(size: 26)) // Тут ви можете задати необхідний розмір шрифту
                        .foregroundColor(.primary)
                }
            }
        .navigationBarTitleDisplayMode(.inline)
            
        }
    }
}

#Preview {
    FunctionalView()
}
