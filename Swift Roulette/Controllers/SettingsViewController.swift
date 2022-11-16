//
//  SettingsViewController.swift
//  Swift Roulette
//
//  Created by мас on 14.11.2022.
//

import UIKit
import Firebase
import StoreKit

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - Buttons actions
    
    @IBAction func ratePressed(_ sender: UIButton) {
        if let scene = UIApplication.shared.connectedScenes.first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene {
            DispatchQueue.main.async {
                SKStoreReviewController.requestReview(in: scene)
            }
        }
    }
    
    @IBAction func sharePressed(_ sender: UIButton) {
            presentShareSheet()
        }
    
    @IBAction func deleteAccountPressed(_ sender: UIButton) {
        
        let user = Auth.auth().currentUser
        
        user?.delete() { error in
          if let error = error {
              print("Unable to delete user; \(error.localizedDescription)")
          } else {
              // Account deleted.
              let storyboard = UIStoryboard(name: "Main", bundle: nil)
              let mainTabBarController = storyboard.instantiateViewController(identifier: "LoginNavigationController")
              mainTabBarController.modalPresentationStyle = .fullScreen
              
              self.present(mainTabBarController, animated: true, completion: nil)
              
            }
        }
    }
    
    @IBAction func logoutPressed(_ sender: UIButton) {
        do {
            try Auth.auth().signOut()

            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let mainTabBarController = storyboard.instantiateViewController(identifier: "LoginNavigationController")
            mainTabBarController.modalPresentationStyle = .fullScreen
            
            self.present(mainTabBarController, animated: true, completion: nil)
            
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
    }
    
    
    // MARK: - Additional functions
    @objc private func presentShareSheet() {
        guard let image = UIImage(systemName: "bell"), let url = URL(string: "https://github.com/RinStar2003/swift-roulette") else { return }
        
        let shareSheetVC = UIActivityViewController(activityItems: [image, url], applicationActivities: nil)
        present(shareSheetVC, animated: true)
    }
    
}
