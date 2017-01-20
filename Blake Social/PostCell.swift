//
//  PostCell.swift
//  Blake Social
//
//  Created by Blake Joynes on 1/19/17.
//  Copyright © 2017 BJ. All rights reserved.
//

import UIKit

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

  func configureCell(post: Post){
    self.post = post
    self.caption.text = post.caption
    self.likesLbl.text = "\(post.likes)"
  }
  

}
