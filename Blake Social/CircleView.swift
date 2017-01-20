//
//  CircleView.swift
//  Blake Social
//
//  Created by Blake Joynes on 1/19/17.
//  Copyright © 2017 BJ. All rights reserved.
//

import UIKit

class CircleView: UIImageView {

  override func awakeFromNib() {
    super.awakeFromNib()
    
    layer.shadowColor = UIColor(red: SHADOW_GREY, green: SHADOW_GREY, blue: SHADOW_GREY, alpha: SHADOW_GREY).cgColor
    
    layer.shadowOpacity = 0.8
    
    layer.shadowRadius = 5.0
    
    layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
    
  }
  
  override func draw(_ rect: CGRect) {
   super.draw(rect)
    
    layer.cornerRadius = self.frame.width / 2
  }

}
