//
//  RoundButton.swift
//  Social Network App
//
//  Created by Darshan Gowda on 07/12/16.
//  Copyright © 2016 Darshan Gowda. All rights reserved.
//

import UIKit

class RoundButton: UIButton {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.shadowColor = UIColor(red: GREY, green: GREY, blue: GREY, alpha: 0.6).cgColor
        layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        layer.shadowRadius = 5.0
        layer.shadowOpacity = 0.8
        imageView?.contentMode = .scaleAspectFit
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = self.frame.width / 2
    }

}
