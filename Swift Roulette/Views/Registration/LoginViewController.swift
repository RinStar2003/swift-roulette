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
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        if let email = emailTextField.text, let password = passwordTextField.text {
        
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            if let e = error {
                print(e.localizedDescription)
            } else {
                // Navigate to the Game Controller
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let mainTabBarController = storyboard.instantiateViewController(identifier: "MainTabBarController")
                    mainTabBarController.modalPresentationStyle = .fullScreen
                    
                    self!.present(mainTabBarController, animated: true, completion: nil)
                
                }
            }
        }
    }
    
}
