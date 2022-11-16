//
//  LoginViewController.swift
//  Swift Roulette
//
//  Created by мас on 14.11.2022.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    @Published var userIsLoggedIn = false
    
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    override func viewDidAppear(_ animated: Bool) {
        checkUserInfo()
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        if let email = emailTextField.text, let password = passwordTextField.text {
        
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            if let e = error {
                let alert = UIAlertController(title: "Warning", message: "\(e.localizedDescription)", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "Close", style: UIAlertAction.Style.default, handler: nil))
                self!.present(alert, animated: true, completion: nil)
            } else {
                // Navigate to the Game Controller
                self!.checkUserInfo()
                    
                }
            }
        }
    }
    
    func checkUserInfo() {
        if Auth.auth().currentUser != nil {
            print(Auth.auth().currentUser?.uid)
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let mainTabBarController = storyboard.instantiateViewController(identifier: "mainTab")
            mainTabBarController.modalPresentationStyle = .fullScreen
            
            self.present(mainTabBarController, animated: true, completion: nil)
        }
    }
    
}
