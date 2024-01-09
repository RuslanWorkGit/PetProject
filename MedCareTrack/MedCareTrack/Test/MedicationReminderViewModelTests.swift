import XCTest
//@testable import MedCareTrack

class MedicationReminderViewModelTests: XCTestCase {
    var viewModels: MedicationReminderViewModel!
    var mockFirestoreService: MockFirestoreService!

    override func setUp() {
        super.setUp()
        mockFirestoreService = MockFirestoreService()
        viewModels = MedicationReminderViewModel(firestoreService: mockFirestoreService)
    }

    override func tearDown() {
        viewModels = nil
        mockFirestoreService = nil
        super.tearDown()
    }

    func testAddReminder() {
        let expectation = self.expectation(description: "AddReminder")
        viewModels.addReminder(name: "Test Medication", dosage: "10mg", time: Date())
        expectation.fulfill()
        waitForExpectations(timeout: 5, handler: nil)

        XCTAssertTrue(mockFirestoreService.reminders.contains {
            $0.name == "Test Medication" && $0.dosage == "10mg"
        })
    }

    // More tests...
}

class MockFirestoreService {
    var reminders: [MedicationReminder] = []

    func addReminder(_ reminder: MedicationReminder) {
        reminders.append(reminder)
    }

    // Mock implementations for other Firestore methods...
}
