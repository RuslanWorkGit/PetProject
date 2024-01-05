

import Foundation
import CoreData

class Allergy: NSManagedObject {
    @NSManaged var name: String
    @NSManaged var descriptions: String
}

class MedicalHistory: NSManagedObject {
    @NSManaged var conditionName: String
    @NSManaged var diagnosisDate: Date
}

class Vaccination: NSManagedObject {
    @NSManaged var name: String
    @NSManaged var date: Date
}

class HealthIndicator: NSManagedObject {
    @NSManaged var type: String
    @NSManaged var value: String
    @NSManaged var date: Date
}
