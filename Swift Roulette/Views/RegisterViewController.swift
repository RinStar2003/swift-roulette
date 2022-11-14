//
//  RegisterViewController.swift
//  Swift Roulette
//
//  Created by мас on 14.11.2022.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {
    
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        if let email = emailTextField.text, let password = passwordTextField.text {
            
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                
                if let e = error {
                    print(e.localizedDescription)
                } else {
                    // Navigate to the Chat Controller
                    self.performSegue(withIdentifier: Constants.registerSegue, sender: self)
                }
                
            }
        }
    }
}
