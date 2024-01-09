import XCTest
@testable import MedCareTrack  // Replace with your actual app's module name

class LoginViewTests: XCTestCase {

    var loginView: LoginView!
    var mockViewModel: MockAuthViewModel!

    override func setUp() {
        super.setUp()
        mockViewModel = MockAuthViewModel()
        loginView = LoginView()
        loginView.viewModel = mockViewModel  // Injecting the mock view model
    }

    override func tearDown() {
        loginView = nil
        mockViewModel = nil
        super.tearDown()
    }

    func testEmailAndPasswordInputBinding() {
        // Assigning test values to the view's email and password fields
        loginView.email = "test@example.com"
        loginView.password = "password123"

        // Asserting that the values are correctly bound to the view's state variables
        XCTAssertEqual(loginView.email, "test@example.com", "Email field should be bound to the state variable.")
        XCTAssertEqual(loginView.password, "password123", "Password field should be bound to the state variable.")
    }

    func testSignInButtonAction() {
        // Setup
        loginView.email = "test@example.com"
        loginView.password = "password123"

        // Simulating the button tap
        loginView.signInButtonTapped()  // This method needs to be exposed in the LoginView for testing purposes

        // Asserting that signIn method of the view model is called with correct parameters
        XCTAssertTrue(mockViewModel.signInCalled, "Sign In should be triggered in the view model.")
        XCTAssertEqual(mockViewModel.emailUsedToSignIn, "test@example.com", "Sign In should be called with correct email.")
        XCTAssertEqual(mockViewModel.passwordUsedToSignIn, "password123", "Sign In should be called with correct password.")
    }
}

class MockAuthViewModel: AuthViewModel {
    var signInCalled = false
    var emailUsedToSignIn: String?
    var passwordUsedToSignIn: String?

    override func signIn(withEmail email: String, password: String) {
        signInCalled = true
        emailUsedToSignIn = email
        passwordUsedToSignIn = password
    }
}
