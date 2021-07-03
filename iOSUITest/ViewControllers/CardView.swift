//
//  CardView.swift
//  iOSUITest
//
//  Created by Tamron iMac 001 on 7/3/21.
//


import UIKit

@IBDesignable
class CardView: UIView, UIGestureRecognizerDelegate {

    @IBInspectable var cornerRadius: CGFloat = 2
    @IBInspectable var shadowOffsetWidth: Int = 0
    @IBInspectable var shadowOffsetHeight: Int = 2
    @IBInspectable var shadowColor: UIColor? = UIColor.black
    @IBInspectable var shadowOpacity: Float = 0.3
    @IBInspectable var borderWidth : CGFloat = 0
    @IBInspectable var borderColor : UIColor = .black
    @IBInspectable var isCircle : Bool = false
    @IBInspectable var isGradiant : Bool = false
    @IBInspectable var startColor : UIColor = .white
    @IBInspectable var endColor : UIColor = .white
    
    // for CardView Gradiend layer
    let gradient: CAGradientLayer = CAGradientLayer()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addTapGestures()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    override func layoutSubviews() {
        
        layer.cornerRadius = isCircle ? self.frame.size.height / 2 : cornerRadius
        layer.borderColor = borderColor.cgColor
        layer.borderWidth = borderWidth
        
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: isCircle ? self.frame.size.height / 2 : cornerRadius)

        layer.masksToBounds = false
        layer.shadowColor = shadowColor?.cgColor
        layer.shadowOffset = CGSize(width: shadowOffsetWidth, height: shadowOffsetHeight);
        layer.shadowOpacity = shadowOpacity
        layer.shadowPath = shadowPath.cgPath
        
        gradient.frame = self.bounds
        
        if isGradiant {
            gradient.colors = [startColor.cgColor, endColor.cgColor]
            gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
            gradient.endPoint = CGPoint(x: 1.0, y: 0.5)
            gradient.cornerRadius = isCircle ? self.frame.size.height / 2 : cornerRadius
            self.layer.insertSublayer(gradient, at: .zero)
        }
        
        super.layoutSubviews()
    }
    
    func addTapGestures() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap(gestureRecognizer:)))
        tap.cancelsTouchesInView = false
        tap.delegate = self
        self.addGestureRecognizer(tap)
    }
    
    @objc func handleTap(gestureRecognizer: UIGestureRecognizer) {
        superview?.endEditing(true)
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        return touch.view is CardView
    }
    
   
}

