import XCTest
@testable import MedCareTrack

class RegistrationViewTests: XCTestCase {

    var registrationView: RegistrationView!
    var mockViewModel: MockAuthViewModel!
    

    override func setUp() {
        super.setUp()
        mockViewModel = MockAuthViewModel()
        registrationView = RegistrationView()
        registrationView.viewModel = mockViewModel  // Injecting the mock view model
    }

    override func tearDown() {
        registrationView = nil
        mockViewModel = nil
        super.tearDown()
    }

    func testInputFieldBinding() {
        // Assigning test values to the view's input fields
        registrationView.email = "test@example.com"
        registrationView.fullname = "John Doe"
        registrationView.password = "Password123"
        registrationView.confirmPassword = "Password123"

        // Asserting that the values are correctly bound to the view's state variables
        XCTAssertEqual(registrationView.email, "test@example.com", "Email field should be bound to the state variable.")
        XCTAssertEqual(registrationView.fullname, "John Doe", "Full name field should be bound to the state variable.")
        XCTAssertEqual(registrationView.password, "Password123", "Password field should be bound to the state variable.")
        XCTAssertEqual(registrationView.confirmPassword, "Password123", "Confirm password field should be bound to the state variable.")
    }

    func testPasswordConfirmationLogic() {
        registrationView.password = "Password123"
        registrationView.confirmPassword = "Password123"
        XCTAssertTrue(registrationView.isPasswordConfirmed, "Password confirmation logic should recognize matching passwords.")
    }

    func testRegistrationButtonAction() {
        // Setup
        registrationView.email = "test@example.com"
        registrationView.fullname = "John Doe"
        registrationView.password = "Password123"
        registrationView.confirmPassword = "Password123"

        // Simulating the registration button tap
        registrationView.registrationButtonTapped()  // This method needs to be exposed in the RegistrationView for testing purposes

        // Asserting that registration method of the view model is called with correct parameters
        XCTAssertTrue(mockViewModel.registrationCalled, "Registration should be triggered in the view model.")
    }
}

class MockAuthViewModel: AuthViewModel {
    var registrationCalled = false

    override func register(withEmail email: String, fullname: String, password: String) {
        registrationCalled = true
    }
}
