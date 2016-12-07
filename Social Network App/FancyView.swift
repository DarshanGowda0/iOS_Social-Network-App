//
//  FancyView.swift
//  Social Network App
//
//  Created by Darshan Gowda on 07/12/16.
//  Copyright © 2016 Darshan Gowda. All rights reserved.
//

import UIKit

class FancyView: UIView {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.shadowColor = UIColor(red: GREY, green: GREY, blue: GREY, alpha: 0.6).cgColor
        layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        layer.shadowRadius = 5.0
        layer.shadowOpacity = 0.8
        
    }
}
