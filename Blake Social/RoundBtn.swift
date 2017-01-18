//
//  RoundBtn.swift
//  Blake Social
//
//  Created by Blake Joynes on 1/17/17.
//  Copyright © 2017 BJ. All rights reserved.
//

import UIKit

class RoundBtn: UIButton {

  override func awakeFromNib() {
    super.awakeFromNib()
    
    layer.shadowColor = UIColor(red: SHADOW_GREY, green: SHADOW_GREY, blue: SHADOW_GREY, alpha: SHADOW_GREY).cgColor
    
    layer.shadowOpacity = 0.8
    
    layer.shadowRadius = 5.0
    
    layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
    
    imageView?.contentMode = .scaleAspectFit
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
    layer.cornerRadius = self.frame.width / 2
    
  }
  
}
