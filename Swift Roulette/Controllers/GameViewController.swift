//
//  GameViewController.swift
//  Swift Roulette
//
//  Created by мас on 14.11.2022.
//

import UIKit
import Firebase

class GameViewController: UIViewController {

    let defaults = UserDefaults.standard
    
    @IBOutlet var accountLabel: UILabel!
    @IBOutlet var scoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        accountLabel.text = Auth.auth().currentUser?.email
    }

}
