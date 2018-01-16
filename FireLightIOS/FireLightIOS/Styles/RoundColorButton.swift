//
//  RoundColorButton.swift
//  FireLightIOS
//
//  Created by Bezançon on 16/01/2018.
//  Copyright © 2018 ynov. All rights reserved.
//

import UIKit

@IBDesignable
class RoundColorButton: UIButton {

//    @IBInspectable var cornerRadius: CGFloat = 0{
//        didSet{
//            self.layer.cornerRadius = cornerRadius
//        }
//    }
//    @IBInspectable var borderWidth: CGFloat = 0{
//        didSet{
//            self.layer.borderWidth = borderWidth
//        }
//    }
//    @IBInspectable var borderColor: UIColor = UIColor.clear{
//        didSet{
//            self.layer.borderColor = borderColor.cgColor
//        }
//    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    override func layoutSubviews() {
        super.layoutSubviews()
        updateCornerRadius()
    }
    @IBInspectable var rounded: Bool = false {
        didSet {
            updateCornerRadius()
        }
    }
    func updateCornerRadius()
    {
        layer.cornerRadius = rounded ? frame.size.height / 2 : 0
    }
    
//    @IBInspectable var borderColor : UIColor?{
//        get {
//            if let color = layer.borderColor {
//                return UIColor(cgColor: color)
//            }
//            return nil
//        }
//        set {
//            if let color = newValue{
//                layer.borderColor = color.cgColor
//            }
//            else{
//                layer.borderColor = nil
//            }
//        }
//    }
    let gradientLayer = CAGradientLayer()
    
    @IBInspectable
    var topGradientColor: UIColor? {
        didSet {
            setGradient(topGradientColor: topGradientColor, bottomGradientColor: bottomGradientColor)
        }
    }
    
    @IBInspectable
    var bottomGradientColor: UIColor? {
        didSet {
            setGradient(topGradientColor: topGradientColor, bottomGradientColor: bottomGradientColor)
        }
    }
    
    private func setGradient(topGradientColor: UIColor?, bottomGradientColor: UIColor?) {
        if let topGradientColor = topGradientColor, let bottomGradientColor = bottomGradientColor {
            gradientLayer.frame = bounds
            gradientLayer.colors = [topGradientColor.cgColor, bottomGradientColor.cgColor]
            gradientLayer.borderColor = layer.borderColor
            gradientLayer.borderWidth = layer.borderWidth
            gradientLayer.cornerRadius = layer.cornerRadius
            layer.insertSublayer(gradientLayer, at: 0)
        } else {
            gradientLayer.removeFromSuperlayer()
        }
    }

}
