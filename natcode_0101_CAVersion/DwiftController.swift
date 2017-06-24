//
//  DwiftController.swift
//  natcode_0101_CAVersion
//
//  Created by Carlyn Maw on 6/24/17.
//  Copyright © 2017 carlynorama. All rights reserved.
//

import UIKit

class DwiftController: UIViewController, UICollisionBehaviorDelegate {
    
    @IBOutlet weak var dwiftView: DwiftView!
    
    var dwiftLayer:CALayer {
        get { return dwiftView.layer }
    }
    
    //let displayLink = CADisplayLink(target: self, selector: #selector(update))
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //MARK: Circle - define and attach
        let circle = CAShapeLayer()
        circle.frame =  CGRect(x: 0.0, y: 0.0, width: 280.0, height: 280.0)
        circle.position = dwiftView.center
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
        rectangle.position = dwiftView.center
        rectangle.cornerRadius = 5.0
        rectangle.backgroundColor = UIColor.white.cgColor
        
        dwiftView.layer.addSublayer(rectangle);
        
        //set up rotation
        let rotationAngle:CGFloat = CGFloat.pi/2
        let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotationAnimation.byValue = rotationAngle
        rotationAnimation.repeatCount = .infinity
        
        //MARK: ShootingStar - Manual Animation
//        let shootingStar = CAShapeLayer()
//        shootingStar.frame =  CGRect(x: 0.0, y: 0.0, width: 10.0, height: 10.0)
//        shootingStar.cornerRadius = 5.0
//        shootingStar.backgroundColor = UIColor.white.cgColor
//        
//        dwiftView.layer.addSublayer(shootingStar);
//        displayLink.add(to: RunLoop.current, forMode: RunLoopMode.defaultRunLoopMode)
        //var orbitVector:CGVector = CGVector(dx:2.0, dy:6.0)
        
        //MARK: Attach animations
        
        //attach animations
        circle.add(circleAnimations, forKey: nil)
        rectangle.add(rotationAnimation, forKey: nil)


    }
    
//    func update() {
//        if let layerToMove = dwiftView.layer.sublayers?[3]{
//        move(item:layerToMove , vector: CGVector(dx:2.0, dy:6.0) )
//    }
//    }
//    
//    
//    func move(item:CALayer, vector:CGVector) {
//        var calculatedPosition = getNewPositition(startPosition: item.position, vector: vector)
//        
//        if calculatedPosition.x > dwiftView.bounds.width || calculatedPosition.y > dwiftView.bounds.height {
//            calculatedPosition = CGPoint(x:0, y:0)
//            
//        }
//        //turn off implicit layer animations by using transaction
//        //necessary so can do the reset jump
//        CATransaction.begin()
//        CATransaction.setDisableActions(true)
//        item.position = calculatedPosition
//        CATransaction.commit()
//        
//    }
//    
//    func getNewPositition(startPosition:CGPoint, vector:CGVector) -> CGPoint {
//        let deltaX:CGFloat = vector.dx
//        let deltaY:CGFloat = vector.dy
//        let newPoint:CGPoint = CGPoint(x: startPosition.x+deltaX, y: startPosition.y+deltaY)
//        return newPoint
//    }
//
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
