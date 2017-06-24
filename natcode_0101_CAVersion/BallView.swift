//
//  BallView.swift
//  natcode_0101_ghostkiller
//
//  Created by Carlyn Maw on 6/23/17.
//  Copyright © 2017 carlynorama. No rights reserved.
//

import UIKit

@IBDesignable
class BallView: UIView {

    @IBInspectable
    internal var ballColor: UIColor = UIColor(colorLiteralRed: 0.270271, green: 0.451499, blue: 0.616321, alpha: 1) {
        didSet {
            self.backgroundColor = self.ballColor
        }
    }
    
        convenience init() {
            self.init(frame: CGRect.zero)
        }
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            setUp()
        }
        
        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            setUp()
        }
        
//        override func setNeedsLayout() {
//            setUp()
//        }
        
        func setUp() {
            let circleFrame = bounds
            let circle = UIView(frame: circleFrame)
            circle.center = center //WARNING, May stop working. If weird placement issues try "convert(center, from: superview)"
            circle.layer.cornerRadius = bounds.width/2
            circle.backgroundColor = ballColor
            addSubview(circle);
        }
        
}
