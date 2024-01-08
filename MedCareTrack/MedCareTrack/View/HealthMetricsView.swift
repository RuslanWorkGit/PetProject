//
//import SwiftUI
//
//struct HealthMetric: Identifiable {
//    let id = UUID()
//    let title: String
//    let value: String
//    let unit: String
//    let color: Color
//    let systemImageName: String
//}
//
//struct MainMetricView: View {
//    let healthMetrics = [
//        HealthMetric(title: "Активність", value: "350", unit: "ккал", color: .orange, systemImageName: "flame.fill"),
//        HealthMetric(title: "Серцевий ритм", value: "71", unit: "уд/хв", color: .red, systemImageName: "heart.fill"),
//        // Add more metrics as needed
//    ]
//    
//    var body: some View {
//        NavigationView {
//            ScrollView {
//                VStack(spacing: 20) {
//                    ForEach(healthMetrics) { metric in
//                        MetricView(metric: metric)
//                    }
//                }
//                .padding()
//            }
//            .navigationTitle("Усі дані Здоров'я")
//        }
//    }
//}
//
//struct MetricView: View {
//    let metric: HealthMetric
//    
//    var body: some View {
//        HStack {
//            Image(systemName: metric.systemImageName)
//                .foregroundColor(metric.color)
//                .padding()
//                .background(metric.color.opacity(0.1))
//                .clipShape(Circle())
//            
//            VStack(alignment: .leading, spacing: 4) {
//                Text(metric.title)
//                    .font(.headline)
//                Text("\(metric.value) \(metric.unit)")
//                    .font(.title2)
//                    .fontWeight(.bold)
//            }
//            
//            Spacer()
//            
//            // This could be a placeholder for a custom progress bar or chart
//            Image(systemName: "waveform.path.ecg")
//                .foregroundColor(metric.color)
//        }
//        .padding()
//        //.background(Color.secondarySystemBackground)
//        .background(Color(.systemGroupedBackground))
//        .cornerRadius(12)
//    }
//}
//
//#Preview {
//    MainMetricView()
//}
