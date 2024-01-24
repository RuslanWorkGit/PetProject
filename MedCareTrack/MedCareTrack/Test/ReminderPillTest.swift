import XCTest
@testable import MedCareTrack

class MockFirestore: Firestore {
    var reminders: [MedicationReminder] = []

    func mockAddReminder(_ reminder: MedicationReminder) {
        reminders.append(reminder)
    }

    func mockFetchReminders(completion: @escaping ([MedicationReminder]) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { // Simulate network delay
            completion(self.reminders)
        }
    }
}

class MedicationReminderViewModelTests: XCTestCase {
    
    var viewModel: MedicationReminderViewModel!
    var mockUserSession: MockUserSession!
    var mockFirestore: MockFirestore!

    override func setUp() {
        super.setUp()
        mockUserSession = MockUserSession()
        mockFirestore = MockFirestore()
        viewModel = MedicationReminderViewModel(userSession: mockUserSession, firestore: mockFirestore)
    }

    override func tearDown() {
        viewModel = nil
        mockUserSession = nil
        mockFirestore = nil
        super.tearDown()
    }

    func testAddReminder() {
        let newReminder = MedicationReminder(id: UUID().uuidString, name: "Test Medication", dosage: "10mg", time: Date())
        mockFirestore.mockAddReminder(newReminder)

        let expectation = XCTestExpectation(description: "Add reminder")
        
        viewModel.addReminder(name: "Test Medication", dosage: "10mg", time: Date())

        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            XCTAssertTrue(self.viewModel.reminders.contains { $0.id == newReminder.id })
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 5)
    }

    func testFetchReminders() {
        let expectation = XCTestExpectation(description: "Fetch reminders")
        
        viewModel.fetchReminders()

        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            XCTAssert(!self.viewModel.reminders.isEmpty)
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 5)
    }

    func testAddNewReminder() {
           let addExpectation = XCTestExpectation(description: "Add new reminder")
           let newReminder = MedicationReminder(id: UUID().uuidString, name: "Medication A", dosage: "100mg", time: Date())

           viewModel.addReminder(name: newReminder.name, dosage: newReminder.dosage, time: newReminder.time)

           DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
               XCTAssertTrue(self.viewModel.reminders.contains { $0.id == newReminder.id })
               addExpectation.fulfill()
           }

           wait(for: [addExpectation], timeout: 5)
       }

       // Test fetching reminders successfully
       func testSuccessfulFetchReminders() {
           let fetchExpectation = XCTestExpectation(description: "Fetch reminders successfully")

           viewModel.fetchReminders()

           DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
               XCTAssertFalse(self.viewModel.reminders.isEmpty)
               fetchExpectation.fulfill()
           }

           wait(for: [fetchExpectation], timeout: 5)
       }

       // Test fetching reminders with an error
       func testFetchRemindersWithError() {
           let errorExpectation = XCTestExpectation(description: "Fetch reminders with error")
           mockFirestore.shouldReturnError = true

           viewModel.fetchReminders()

           DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
               XCTAssertTrue(self.viewModel.reminders.isEmpty)
               errorExpectation.fulfill()
           }

           wait(for: [errorExpectation], timeout: 5)
       }

       // Test deletion of a reminder
       func testDeleteReminder() {
           let deleteExpectation = XCTestExpectation(description: "Delete reminder")
           // Assuming the ViewModel has a method for deleting a reminder
           let reminderToDelete = viewModel.reminders.first!

           viewModel.deleteReminder(reminderToDelete)

           DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
               XCTAssertFalse(self.viewModel.reminders.contains(reminderToDelete))
               deleteExpectation.fulfill()
           }

           wait(for: [deleteExpectation], timeout: 5)
       }
}

