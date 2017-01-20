//
//  FeedVC.swift
//  Blake Social
//
//  Created by Blake Joynes on 1/18/17.
//  Copyright © 2017 BJ. All rights reserved.
//

import UIKit
import SwiftKeychainWrapper
import Firebase

class FeedVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
  @IBAction func signOutTapped(_ sender: Any) {
    let keychainResult = KeychainWrapper.standard.remove(key: KEY_UID)
    print("JESS: ID removed from keychain - \(keychainResult)")
    try! FIRAuth.auth()?.signOut()
    
    performSegue(withIdentifier: "goToSignIn", sender: nil)
  }

}
