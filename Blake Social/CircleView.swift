//
//  CircleView.swift
//  Blake Social
//
//  Created by Blake Joynes on 1/19/17.
//  Copyright © 2017 BJ. All rights reserved.
//

import UIKit

class CircleView: UIImageView {
  
  
  override func layoutSubviews() {
    
    layer.cornerRadius = self.frame.width / 2
      }

}
