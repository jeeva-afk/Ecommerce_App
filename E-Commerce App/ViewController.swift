import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // UI Setup
        passwordTextField.isSecureTextEntry = true
    }

    @IBAction func loginTapped(_ sender: UIButton) {
        guard let email = emailTextField.text, !email.isEmpty,
              let password = passwordTextField.text, !password.isEmpty else {
            
            showAlert(message: "Please enter email and password")
            return
        }
        
        // Dummy validation (replace with Core Data later)
        if email == "test@gmail.com" && password == "1234" {
            goToHome()
        } else {
            showAlert(message: "Invalid credentials")
        }
    }
    }
    

// MARK: - Navigation
extension ViewController {
    
    func goToHome() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let nav = storyboard.instantiateViewController(withIdentifier: "HomeNavController")
        
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let window = windowScene.windows.first {
            
            window.rootViewController = nav
            window.makeKeyAndVisible()
        }
    }
}

// MARK: - Alert
extension ViewController {
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Login", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}
