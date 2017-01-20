//
//  PostCell.swift
//  Blake Social
//
//  Created by Blake Joynes on 1/19/17.
//  Copyright © 2017 BJ. All rights reserved.
//

import UIKit
import Firebase

class PostCell: UITableViewCell {

  @IBOutlet weak var profileImage: UIImageView!
  @IBOutlet weak var userLabel: UILabel!
  @IBOutlet weak var postImage: UIImageView!
  @IBOutlet weak var caption: UITextView!
  @IBOutlet weak var likesLbl: UILabel!
  
  var post: Post!
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

  func configureCell(post: Post, img: UIImage? = nil){
    self.post = post
    self.caption.text = post.caption
    self.likesLbl.text = "\(post.likes)"
    
    if img != nil{
      self.postImage.image = img
    }else{
    
        let ref = FIRStorage.storage().reference(forURL: post.imageUrl)
        ref.data(withMaxSize: 2 * 1024 * 1024, completion: {(data,error) in
          if error != nil{
            print("JESS: Unable to download image from Firebase storage")
          }else{
            print("JESS: Image download from Firebase storage successfully")
            if let imgData = data{
              if let img = UIImage(data: imgData){
                self.postImage.image = img
                FeedVC.imageCache.setObject(img, forKey: post.imageUrl as NSString)
              }
            }
          }
      })
      }
    }
    
  }
  


