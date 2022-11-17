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
                    let alert = UIAlertController(title: "Alert", message: "\(e.localizedDescription)", preferredStyle: UIAlertController.Style.alert)
                    alert.addAction(UIAlertAction(title: "Close", style: UIAlertAction.Style.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                } else {
                    // Navigate to the Game Controller
                    self.checkUserInfo()
                }
            }
        }
    }
    
    func checkUserInfo() {
        print(Auth.auth().currentUser?.uid)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let mainTabBarController = storyboard.instantiateViewController(identifier: "mainTab")
        
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainTabBarController)
    }
}
