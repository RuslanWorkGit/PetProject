//
//  HealthKitSetupAssistant.swift
//  MedCareTrack
//
//  Created by Ruslan Liulka on 07.01.2024.
//

import HealthKit

class HealthKitSetupAssistant {

    enum HealthkitSetupError: Error {
        case notAvailableOnDevice
        case dataTypeNotAvailable
    }
  
    private let healthStore = HKHealthStore()
  
    public func authorizeHealthKit(completion: @escaping (Bool, Error?) -> Swift.Void) {
        // 1. Перевіряємо, чи HealthKit доступний на цьому пристрої
        guard HKHealthStore.isHealthDataAvailable() else {
            completion(false, HealthkitSetupError.notAvailableOnDevice)
            return
        }
    
        // 2. Готуємо дані, які ми хочемо читати і писати
        guard
            let activeEnergy = HKObjectType.quantityType(forIdentifier: .activeEnergyBurned),
            let heartRate = HKObjectType.quantityType(forIdentifier: .heartRate)
            // додайте інші типи даних, які вам потрібні
        else {
            completion(false, HealthkitSetupError.dataTypeNotAvailable)
            return
        }
    
        // 3. Створюємо набір даних HealthKit, які ми хочемо запитувати
        let healthKitTypesToRead: Set<HKObjectType> = [activeEnergy, heartRate /* ... інші типи даних ... */]
    
        // 4. Запитуємо дозвіл на доступ до цих даних
        healthStore.requestAuthorization(toShare: nil, read: healthKitTypesToRead) { (success, error) in
            completion(success, error)
        }
    }
}

