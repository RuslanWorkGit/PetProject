import HealthKit
import Combine

class HealthDataStore: ObservableObject {
    
    private var healthStore: HKHealthStore?
    private var cancellables: Set<AnyCancellable> = []

    @Published var heartRate: Double? // Приклад даних, які ми хочемо спостерігати

    init() {
        if HKHealthStore.isHealthDataAvailable() {
            healthStore = HKHealthStore()
        }
    }
    
    func readHeartRateData() {
        // Тут ми описуємо, як читати дані про серцевий ритм
        guard let heartRateType = HKQuantityType.quantityType(forIdentifier: .heartRate) else {
            return
        }
        
        let query = HKSampleQuery(sampleType: heartRateType, predicate: nil, limit: HKObjectQueryNoLimit, sortDescriptors: nil) { [weak self] (query, samples, error) in
            guard let samples = samples as? [HKQuantitySample] else {
                return
            }
            
            // Оновлюємо дані у основній черзі
            DispatchQueue.main.async {
                self?.heartRate = samples.last?.quantity.doubleValue(for: HKUnit(from: "count/min"))
            }
        }
        
        healthStore?.execute(query)
    }
    
}
