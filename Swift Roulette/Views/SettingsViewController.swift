//
//  SettingsViewController.swift
//  Swift Roulette
//
//  Created by мас on 14.11.2022.
//

import UIKit
import StoreKit

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func ratePressed(_ sender: UIButton) {
        SKStoreReviewController.requestReview()
    }
    
    @IBAction func logoutPressed(_ sender: UIButton) {
        
    }
    
    @IBAction func sharePressed(_ sender: UIButton) {
        presentShareSheet()
    }
    
    
    // MARK: - Additional functions
    @objc private func presentShareSheet() {
        guard let image = UIImage(systemName: "bell"), let url = URL(string: "https://github.com/RinStar2003/swift-roulette") else { return }
        
        let shareSheetVC = UIActivityViewController(activityItems: [image, url], applicationActivities: nil)
        present(shareSheetVC, animated: true)
    }
    
}
