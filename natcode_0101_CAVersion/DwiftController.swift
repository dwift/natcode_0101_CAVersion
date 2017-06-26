//
//  DwiftController.swift
//  natcode_0101_CAVersion
//
//  Created by Carlyn Maw on 6/24/17.
//  Copyright © 2017 carlynorama. All rights reserved.
//

//https://stackoverflow.com/questions/38112061/correct-handling-cleanup-etc-of-cadisplaylink-in-swift-custom-animation
//https://www.raywenderlich.com/100939/how-to-create-an-elastic-animation-with-swift

import UIKit

class DwiftController: UIViewController, UICollisionBehaviorDelegate {
    
    @IBOutlet weak var dwiftView: DwiftView!
    
    var dwiftLayer:CALayer {
        get { return dwiftView.layer }
    }
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: Circle - define and attach
        let circle = CAShapeLayer()
        circle.frame =  CGRect(x: 0.0, y: 0.0, width: 280.0, height: 280.0)
        circle.position = CGPoint(x:dwiftView.bounds.midX, y:dwiftView.bounds.midY)
        circle.cornerRadius = circle.frame.width/2
        
        
        let startingColor = UIColor(red: (253.0/255.0), green: (159.0/255.0), blue: (47.0/255.0), alpha: 1.0)
        let endingColor = UIColor(red: (255.0/255.0), green: (61.0/255.0), blue: (24.0/255.0), alpha: 1.0)
        
        let startingOpacity:Float = 0
        let endingOpacity:Float = 1
        
        let startingScale = CATransform3DMakeScale(0.10, 0.10, 1)
        let endingScale = CATransform3DMakeScale(1, 1, 1)  //100%
        
        
        //set the circle to all the ending properties
        circle.backgroundColor = endingColor.cgColor
        circle.opacity = endingOpacity
        circle.transform = endingScale
        
        dwiftView.layer.addSublayer(circle);
        
        //define animations
        let opacity = CABasicAnimation(keyPath: "opacity")
        opacity.fromValue = startingOpacity
        
        let colorShift = CABasicAnimation(keyPath: "backgroundColor")
        colorShift.fromValue = startingColor.cgColor
        
        let scaleUp = CABasicAnimation(keyPath: "transform")
        scaleUp.fromValue = startingScale
        
        let circleAnimations = CAAnimationGroup()
        circleAnimations.duration = 4.0
        circleAnimations.autoreverses = true
        circleAnimations.repeatCount = 1.5
        circleAnimations.animations = [colorShift, scaleUp, opacity]
        
        
        //MARK: Rectangle
        
        let rectangle = CAShapeLayer()
        rectangle.frame =  CGRect(x: 0.0, y: 0.0, width: 50.0, height: 50.0)
        rectangle.position = dwiftView.convert(dwiftView.center, from: dwiftView.superview)
        rectangle.cornerRadius = 5.0
        rectangle.backgroundColor = UIColor.white.cgColor
        
        dwiftView.layer.addSublayer(rectangle);
        
        //set up rotation
        let rotationAngle:CGFloat = CGFloat.pi/2
        let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotationAnimation.byValue = rotationAngle
        rotationAnimation.repeatCount = .infinity

        
        //MARK: Attach animations
        
        //attach animations
        circle.add(circleAnimations, forKey: nil)
        rectangle.add(rotationAnimation, forKey: nil)


    }
    


    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
