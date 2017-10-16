//
//  ApplyViewController.swift
//  CAAminationDemo
//
//  Created by 梁雅軒 on 2017/9/28.
//  Copyright © 2017年 zoaks. All rights reserved.
//

import UIKit
extension UIViewController{
    func hi() {
        print("hi")
    }
}
class ApplyViewController: UIViewController,CAAnimationDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func btnOnClick(_ sender: UIButton) {
        configTopSpapeLayer()
        configBottomSpapeLayer()
    }
    
    func configTopSpapeLayer() {
        let topLayer = CALayer()
        let topBezier = UIBezierPath()
        topBezier.move(to: CGPoint(x: -1, y: -1))
        topBezier.addLine(to: CGPoint(x: self.view.bounds.width+1, y: -1))
        topBezier.addCurve(to: CGPoint(x: self.view.bounds.width/2+1, y: self.view.bounds.height/2+1), controlPoint1: CGPoint(x: self.view.bounds.width+1, y: 1), controlPoint2: CGPoint(x: 344.5, y: 243.5))
        topBezier.addCurve(to: CGPoint(x: -1, y: self.view.bounds.height + 2), controlPoint1: CGPoint(x: 33.5, y: 426.5), controlPoint2: CGPoint(x: 2, y: self.view.bounds.height + 2))
        topBezier.addLine(to: CGPoint(x: -1, y: -1))
        topBezier.close()
        let topShape = CAShapeLayer()
        topShape.path = topBezier.cgPath
        topLayer.contents = UIImage(named:"icon.png")?.cgImage
        topLayer.frame = self.view.bounds
        self.view.layer.addSublayer(topLayer)
        topLayer.mask = topShape
        
        let topAnimation = CABasicAnimation(keyPath: "anchorPoint")
        topAnimation.toValue = CGPoint(x: 1, y: 1)
        topAnimation.duration = 1
        topAnimation.setValue(topLayer, forKey: "top")
        topAnimation.isRemovedOnCompletion = false
        topAnimation.fillMode = kCAFillModeForwards
        topAnimation.delegate = self
        topLayer.add(topAnimation, forKey: "topAnimation")
        
    }
    
    func configBottomSpapeLayer() {
        let bottomLayer = CALayer()
        let bottomBezier = UIBezierPath()
        bottomBezier.move(to: CGPoint(x: self.view.bounds.width, y: 0))
        bottomBezier.addCurve(to: CGPoint(x: self.view.bounds.width/2, y: self.view.bounds.height/2), controlPoint1: CGPoint(x: self.view.bounds.width, y: 0), controlPoint2: CGPoint(x: 343.5, y: 242.5))
        bottomBezier.addCurve(to: CGPoint(x: 0, y: self.view.bounds.height), controlPoint1: CGPoint(x: 31.5, y: 424.5), controlPoint2: CGPoint(x: 0, y: self.view.bounds.height))
        
        bottomBezier.addLine(to: CGPoint(x: self.view.bounds.width, y: self.view.bounds.height))
        bottomBezier.addLine(to: CGPoint(x: self.view.bounds.width, y: 0))
        bottomBezier.close()
        let bottomShape = CAShapeLayer()
        bottomShape.path = bottomBezier.cgPath
        bottomLayer.contents = UIImage(named:"icon.png")?.cgImage
        bottomLayer.frame = self.view.bounds
        self.view.layer.addSublayer(bottomLayer)
        bottomLayer.mask = bottomShape
        
        let bottomAnimation = CABasicAnimation(keyPath: "anchorPoint")
        bottomAnimation.toValue = CGPoint(x: 0, y: 0)
        bottomAnimation.duration = 1
        bottomAnimation.setValue(bottomLayer, forKey: "bottom")
        bottomAnimation.isRemovedOnCompletion = false
        bottomAnimation.fillMode = kCAFillModeForwards
        bottomAnimation.delegate = self
        bottomLayer.add(bottomAnimation, forKey: "topAnimation")
    }
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        if flag {
            if let topLayer = anim.value(forKey: "top") as? CALayer {
                topLayer.removeFromSuperlayer()
            } else if let bottomLayer = anim.value(forKey: "bottom") as? CALayer {
                bottomLayer.removeFromSuperlayer()
            }
        }
    }
}
