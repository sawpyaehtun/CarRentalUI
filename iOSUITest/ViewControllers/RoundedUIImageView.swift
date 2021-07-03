//
//  RoundedUIImageView.swift
//  iOSUITest
//
//  Created by Tamron iMac 001 on 7/3/21.
//


import UIKit

@IBDesignable
class RoundedUIImageView: UIImageView {

    @IBInspectable var cornerRadius: CGFloat = 2
    @IBInspectable var borderWidth : CGFloat = 0
    @IBInspectable var borderColor : UIColor = UIColor.clear
    @IBInspectable var isCircle : Bool = false
    
    override func layoutSubviews() {
        layer.cornerRadius = isCircle ? self.frame.size.height / 2 : cornerRadius
        layer.borderColor = borderColor.cgColor
        layer.borderWidth = borderWidth
        super.layoutSubviews()
    }
    
}
