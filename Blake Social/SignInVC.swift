//
//  ViewController.swift
//  Blake Social
//
//  Created by Blake Joynes on 1/16/17.
//  Copyright © 2017 BJ. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import Firebase
import SwiftKeychainWrapper


class SignInVC: UIViewController {

  @IBOutlet weak var emailField: NiceField!
  @IBOutlet weak var pwdField: NiceField!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
  
  }
  
  override func viewDidAppear(_ animated: Bool) {
    if let _ = KeychainWrapper.standard.string(forKey: KEY_UID){
      print("JESS: ID was found in keychain")
      performSegue(withIdentifier: "goToFeed", sender: nil)
    }
  }
  
  @IBAction func facebookBtnTapped(_ sender: Any) {
    
    let facebookLogin = FBSDKLoginManager()
    facebookLogin.logIn(withReadPermissions: ["email"], from: self){(result,error) in
      if error != nil{
        print("JESS: Unable to authenticate with Facebook - \(error)")
      }else if result?.isCancelled == true{
        print("JESS: User cancelled Facebook authentication")
      }else{
        print("JESS: Successfully authenticated with Facebook")
        let credential = FIRFacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
        
        self.firebaseAuth(credential)
      }
  }
 
  }
 
  func firebaseAuth(_ credential: FIRAuthCredential){
    FIRAuth.auth()?.signIn(with: credential, completion: {(user,error) in
      if error != nil{
        print("JESS: Unable to authenticate with Firebase - \(error)")

      }else{
        print("JESS: Successfully authenticated with Firebase")
        if let user = user{
self.completeSignIn(id: user.uid)
        }
      }
  })
  }
  
  @IBAction func signInTapped(_ sender: Any) {
    if let email = emailField.text, let password = pwdField.text{
      FIRAuth.auth()?.signIn(withEmail: email, password: password, completion: {(user,error) in
        if error == nil{
          print("JESS: Email user authenticated with Firebase")
          if let user = user{
          self.completeSignIn(id: user.uid)
          }
        }else{
          FIRAuth.auth()?.createUser(withEmail: email, password: password, completion: {(user,error) in
            if error != nil{
              print("JESS: Unable to authenticate with Firebase using email")
            }else{
              print("JESS: Successfully authenticated with Firebase")
              if let user = user{
              self.completeSignIn(id: user.uid)
              }
            }
          })
        }
        })
    }
    
    
  }
  
  
  func completeSignIn(id: String){
    let keychainResult = KeychainWrapper.standard.set(id, forKey: KEY_UID)
    print("JESS:Data saved to keychain - \(keychainResult)")
    performSegue(withIdentifier: "goToFeed", sender: nil)
  }
  

}

