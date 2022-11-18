//
//  Constants.swift
//  Swift Roulette
//
//  Created by мас on 14.11.2022.
//

import Foundation
import Firebase

struct Service {
    
    var game: [Game] = []
    
    static let cellIdentifier = "ReusableCell"
    
    static let collectionName = "game"
    static let userField = "user"
    static let scoreField = "score"
    
    
    static func getUserInfo(onSuccess: @escaping () -> Void, onError: @escaping (_ error: Error?) -> Void) {
        let db = Firestore.firestore().collection("userScoreKey")
        let defaults = UserDefaults.standard
        
        guard let uid = Auth.auth().currentUser?.uid else {
            print("User not found")
            return
        }
    
    }
    
}
