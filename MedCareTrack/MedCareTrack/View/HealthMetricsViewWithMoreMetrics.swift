
import SwiftUI

struct HealthMetric: Identifiable {
    let id = UUID()
    let title: String
    let value: String
    let unit: String
    let color: Color
    let systemImageName: String
}

struct MainMetricView: View {
    let healthMetrics = [
        HealthMetric(title: "Активність", value: "350", unit: "ккал", color: .orange, systemImageName: "flame.fill"),
        HealthMetric(title: "Серцевий ритм", value: "71", unit: "уд/хв", color: .red, systemImageName: "heart.fill"),
        HealthMetric(title: "Час у сні", value: "7", unit: "год", color: .blue, systemImageName: "bed.double.fill"),
        HealthMetric(title: "Кількість кроків", value: "9,291", unit: "кроків", color: .green, systemImageName: "figure.walk"),
        HealthMetric(title: "Рівень кисню у крові", value: "98", unit: "%", color: .blue, systemImageName: "lungs.fill"),
        HealthMetric(title: "ЕКГ", value: "Нормально", unit: "", color: .purple, systemImageName: "waveform.path.ecg"),
        HealthMetric(title: "Час руху/Вправи", value: "30", unit: "хв", color: .green, systemImageName: "figure.walk.circle.fill"),
        HealthMetric(title: "Стояння", value: "12", unit: "год", color: .yellow, systemImageName: "figure.stand.line.dotted.figure.stand"),
        HealthMetric(title: "Частота дихання", value: "16", unit: "уд/хв", color: .blue, systemImageName: "wind")
        // Add more metrics as needed
    ]
    
    let personalMetrics = [
        HealthMetric(title: "Зріст", value: "189", unit: "см", color: .gray, systemImageName: "arrow.up.and.down"),
        HealthMetric(title: "Вага", value: "83", unit: "кг", color: .gray, systemImageName: "scalemass")
        // Add more personal metrics if needed
    ]
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Основні показники")) {
                    ForEach(healthMetrics) { metric in
                        MetricView(metric: metric)
                    }
                }
                
                Section(header: Text("Дані про людину")) {
                    ForEach(personalMetrics) { metric in
                        MetricView(metric: metric)
                    }
                }
            }
            .listStyle(GroupedListStyle())
            .navigationTitle("Усі дані Здоров'я")
        }
    }
}

struct MetricView: View {
    let metric: HealthMetric
    
    var body: some View {
        HStack {
            Image(systemName: metric.systemImageName)
                .foregroundColor(metric.color)
                .padding()
                .background(metric.color.opacity(0.1))
                .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 4) {
                Text(metric.title)
                    .font(.headline)
                Text("\(metric.value) \(metric.unit)")
                    .font(.title2)
                    .fontWeight(.bold)
            }
            
            Spacer()
            
            // This could be a placeholder for a custom progress bar or chart
            Image(systemName: "waveform.path.ecg")
                .foregroundColor(metric.color)
        }
        .padding()
        //.background(Color.secondarySystemBackground)
        .background(Color(.systemGroupedBackground))
        .cornerRadius(12)
    }
}

#Preview {
    MainMetricView()
}
