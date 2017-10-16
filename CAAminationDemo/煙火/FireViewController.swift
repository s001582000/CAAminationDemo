//
//  FireViewController.swift
//  CAAminationDemo
//
//  Created by 梁雅軒 on 2017/9/25.
//  Copyright © 2017年 zoaks. All rights reserved.
//

import UIKit

class FireViewController: UIViewController {
    var bigLayer = CALayer()
    override func viewDidLoad() {
        super.viewDidLoad()
        let view = YCMyView(frame: self.view.bounds)
        view.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        self.view.addSubview(view)
        
//        self.view.addGestureRecognizer(UILongPressGestureRecognizer(target: self, action: #selector(tapView)))
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @objc func tapView(targeg:UILongPressGestureRecognizer) {
//        let location = targeg.location(in: self.view)
//        let later = YCLayer()
//        let from = CGPoint(x: location.x, y: self.view.frame.size.height - 50)
//        let to = CGPoint(x: location.x, y: (self.view.frame.size.height - 100) * CGFloat(arc4random() % 100) / 100.0)
//        later.animationInLayer(targetLayer: self.view.layer, from: from, to: to)
    }

}

class YCMyView: UIView {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let location = touch.location(in: self)
            let force = touch.force
            let later = YCLayer(force: force)
            let from = CGPoint(x: location.x, y: self.frame.size.height - 50)
            let to = CGPoint(x: location.x, y: (self.frame.size.height - 100) * CGFloat(arc4random() % 100) / 100.0)
            later.animationInLayer(targetLayer: self.layer, from: from, to: to)
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
}

class YCLayer: CALayer,CAAnimationDelegate{
 init(force:CGFloat) {
        super.init()
    var mForce:CGFloat = 1
    if force > 0 {
        mForce = force
    }
        self.bounds = CGRect(x: 0, y: 0, width: 20*mForce, height: 20*mForce)
//        let cgColor = UIColor(red: CGFloat(arc4random()%255)/255.0, green: CGFloat(arc4random()%255)/255.0, blue: CGFloat(arc4random()%255)/255.0, alpha: 1).cgColor
        for _ in 0...7 {
            let layer = CALayer()
//            layer.backgroundColor = cgColor
            layer.contents = UIImage(named: "icon.png")?.cgImage
            layer.bounds = CGRect(x: 0, y: 0, width: 20*mForce, height: 20*mForce)
            layer.position = CGPoint.zero
            layer.cornerRadius = layer.frame.size.width/2
            self.addSublayer(layer)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func animationInLayer(targetLayer:CALayer,from:CGPoint,to:CGPoint) {
        self.position = from
        targetLayer.addSublayer(self)
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.5
        animation.isRemovedOnCompletion = false
        animation.fillMode = kCAFillModeForwards
        animation.fromValue = from
        animation.toValue = to
        animation.delegate = self
        self.add(animation, forKey: "move")
    }
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        if anim == self.animation(forKey: "move") {
            var count = 1
            if self.sublayers!.count > 0 {
                count = self.sublayers!.count
            }
            var index = 0
            let radius = 300 * Double(arc4random() % 100) / 100.0
            for subLayer in self.sublayers! {
                let r = Double.pi * 2 / Double(count) * Double(index)
                let x = cos(r) * radius
                let y = sin(r) * radius
                let position = CABasicAnimation(keyPath: "position")
                position.fromValue = subLayer.position
                position.toValue = CGPoint(x: CGFloat(x), y: CGFloat(y))
                
                let opacity = CABasicAnimation(keyPath: "opacity")
                opacity.fromValue = 0.5
                opacity.toValue = 0
                
                let group = CAAnimationGroup()
                group.duration = 0.5
                group.animations = [position,opacity]
                group.isRemovedOnCompletion = false
                group.fillMode = kCAFillModeForwards
                group.delegate = self
                subLayer.add(group, forKey: "explode")
                index += 1
            }
        } else if anim == self.sublayers?.last?.animation(forKey: "explode") {
            self.removeFromSuperlayer()
        }
    }
}
