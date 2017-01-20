//
//  DataService.swift
//  Blake Social
//
//  Created by Blake Joynes on 1/19/17.
//  Copyright © 2017 BJ. All rights reserved.
//

import Foundation
import Firebase


let  DB = FIRDatabase.database().reference()
let STORAGE_BASE = FIRStorage.storage().reference()


class DataService{
  static let ds = DataService()
  
  //DB References
  private var _REF_BASE = DB
  private var _REF_POSTS = DB.child("posts")
  private var _REF_USERS = DB.child("users")
  
  
  //Storage references
  private var _REF_POST_IMAGES = STORAGE_BASE.child("post-pics/")
  
  var REF_BASE: FIRDatabaseReference{
    return _REF_BASE
  }
  
  var REF_POSTS: FIRDatabaseReference{
    return _REF_POSTS
  }
  
  var REF_USERS: FIRDatabaseReference{
    return _REF_USERS
  }
  
  var REF_POST_IMAGES: FIRStorageReference{
    return _REF_POST_IMAGES
  }
  
  func createFirebaseDBUser(uid: String, userData: Dictionary<String,String> ){
    REF_USERS.child(uid).updateChildValues(userData)
  }
  
}
