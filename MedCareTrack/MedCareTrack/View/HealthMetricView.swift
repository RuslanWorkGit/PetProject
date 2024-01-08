//
//  HealthMetricView.swift
//  MedCareTrack
//
//  Created by Ruslan Liulka on 07.01.2024.
//

import SwiftUI

struct HealthMetricView: View {
    var metricName: String
    var metricValue: String
    var metricUnit: String?
    var color: Color
    var systemImageName: String
    
    var body: some View {
        HStack {
            Image(systemName: systemImageName)
                .foregroundColor(color)
                .padding(8)
                .background(color.opacity(0.1))
                .cornerRadius(8)
            
            VStack(alignment: .leading) {
                Text(metricName).font(.headline)
                Text(metricValue).bold() + (metricUnit != nil ? Text(" \(metricUnit!)").bold() : Text(""))
            }
            
            Spacer()
            
            // This is a placeholder for the progress bar
            ProgressBarView(progress: 0.4, color: color)
                .frame(width: 100, height: 20)
        }
        .padding()
        .background(Color.black.opacity(0.1))
        .cornerRadius(10)
    }
}

struct ProgressBarView: View {
    var progress: CGFloat
    var color: Color
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle().frame(width: geometry.size.width , height: geometry.size.height)
                    .opacity(0.3)
                    .foregroundColor(Color(UIColor.systemTeal))
                
                Rectangle().frame(width: min(CGFloat(self.progress)*geometry.size.width, geometry.size.width), height: geometry.size.height)
                    .foregroundColor(color)
                    .animation(.linear(duration: 1.0), value: progress)
            }.cornerRadius(45.0)
        }
    }
}

struct NabinetView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                HealthMetricView(
                    metricName: "Активність",
                    metricValue: "350 ккал",
                    color: .orange,
                    systemImageName: "flame.fill"
                )
                // ... Інші метрики
            }
        }
        .navigationBarTitle(Text("Всі дані Здоров'я"), displayMode: .inline)
    }
}


#Preview {
    NabinetView()
}
