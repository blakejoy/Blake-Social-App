//
//  NiceField.swift
//  Blake Social
//
//  Created by Blake Joynes on 1/17/17.
//  Copyright © 2017 BJ. All rights reserved.
//

import UIKit

class NiceField: UITextField {

  override func awakeFromNib() {
    super.awakeFromNib()
    
    layer.borderColor = UIColor(red: SHADOW_GREY, green: SHADOW_GREY, blue: SHADOW_GREY, alpha: 0.2).cgColor
    layer.borderWidth = 1.0
    layer.cornerRadius = 2.0
  }
  
  override func textRect(forBounds bounds: CGRect) -> CGRect {
    return bounds.insetBy(dx: 10, dy: 5)
  }

  override func editingRect(forBounds bounds: CGRect) -> CGRect {
    return bounds.insetBy(dx: 10, dy: 5)
  }
}
