
import UIKit
import SwiftUI
import Firebase

class ViewController: UIViewController {
    @StateObject var viewModel = AuthViewModel()
    
    init() {
            super.init(nibName: nil, bundle: nil) // Call to super.init
            FirebaseApp.configure()
        }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        FirebaseApp.configure()
        // Initialize your viewModel or any other setup needed
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let logInView = ContentView()
            .environmentObject(viewModel)
        
        let hostingController = UIHostingController(rootView: logInView)
        addChild(hostingController)
        view.addSubview(hostingController.view)
        
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        hostingController.view.frame = view.bounds
        
        NSLayoutConstraint.activate([
            hostingController.view.topAnchor.constraint(equalTo: view.topAnchor),
            hostingController.view.leftAnchor.constraint(equalTo: view.leftAnchor),
            hostingController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            hostingController.view.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
        
        hostingController.didMove(toParent: self)
    }


}

