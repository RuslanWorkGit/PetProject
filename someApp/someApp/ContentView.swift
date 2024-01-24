//
//  ContentView.swift
//  someApp
//
//  Created by Ruslan Liulka on 11.01.2024.
//

import SwiftUI


import SwiftUI

struct ContentView: View {
    @AppStorage("fontSize") private var fontSize = 16
    @AppStorage("voiceAssistance") private var voiceAssistance = false
    @AppStorage("colorSchemeIndex") private var colorSchemeIndex = 0
    @AppStorage("screenScale") private var screenScale = 1.0
    @AppStorage("interfaceTemplate") private var interfaceTemplate = 0
    @AppStorage("iconSizeIndex") private var iconSizeIndex = 1
    @AppStorage("voiceLanguage") private var voiceLanguage = "Українська"


    var body: some View {
        Text("Налаштування додаткових можливостей")
            .fontWeight(.bold)
        Form {
            Section(header: Text("Змінити розмір шрифту")) {
                Stepper(value: $fontSize, in: 12...32, step: 2) {
                    Text("\(fontSize) pt")
                }
            }
            
            Section(header: Text("Голосовий супровід")) {
                Toggle("Увімкнути голосовий супровід", isOn: $voiceAssistance)
            }
            
            Section(header: Text("Завантаження іншої мови для голосового супроводу")) {
                Picker("Мова голосового супроводу", selection: $voiceLanguage) {
                    Text("Українська").tag("Українська")
                    Text("Англійська").tag("Англійська")
                    Text("Польська").tag("Польська")
                }
                .pickerStyle(DefaultPickerStyle())
            }
            
            Section(header: Text("Кольорова схема і контраст")) {
                Picker("Вибрати кольорову схему", selection: $colorSchemeIndex) {
                    Text("Схема 1").tag(0)
                    Text("Схема 2").tag(1)
                    Text("Схема 3").tag(2)
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            
            Section(header: Text("Масштабування екрану")) {
                Slider(value: $screenScale, in: 0.5...2.0, step: 0.1) {
                    Text("Масштаб: \(screenScale, specifier: "%.1f")x")
                }
            }
            
            Section(header: Text("Спеціальні шаблони інтерфейсу")) {
                Picker("Вибрати шаблон інтерфейсу", selection: $interfaceTemplate) {
                    Text("Шаблон 1").tag(0)
                    Text("Шаблон 2").tag(1)
                    Text("Шаблон 3").tag(2)
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            
            Section(header: Text("Вибір розміру іконок в додатку")) {
                Picker("Вибрати розмір іконок", selection: $iconSizeIndex) {
                    Text("Малий").tag(0)
                    Text("Середній").tag(1)
                    Text("Великий").tag(2)
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            

            
        }
        .navigationBarTitle("Налаштування")
    }
}




#Preview {
    ContentView()
}
