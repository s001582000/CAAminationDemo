//
//  KeyFrameViewController.swift
//  CAAminationDemo
//
//  Created by 梁雅軒 on 2017/9/27.
//  Copyright © 2017年 zoaks. All rights reserved.
//

import UIKit

class KeyFrameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let layer = CALayer()
        layer.backgroundColor = UIColor.red.cgColor
        layer.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        self.view.layer.addSublayer(layer)
        指定位置(layer)
        
        let layerOrange = CALayer()
        layerOrange.backgroundColor = UIColor.orange.cgColor
        layerOrange.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        self.view.layer.addSublayer(layerOrange)
        弧度(layerOrange, layerOrange.position, CGPoint(x: self.view.center.x, y: self.view.frame.size.height), high: 100)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func 指定位置(_ layer:CALayer) {
        let animation = CAKeyframeAnimation(keyPath: "position")
        let post1 = CGPoint(x: 50, y: 300)
        let post2 = CGPoint(x: 50, y: 100)
        let post3 = CGPoint(x: 200, y: 100)
        let post4 = CGPoint(x: 200, y: 300)
        
        animation.values = [post1,post2,post3,post4,post1]
        animation.duration = 2
//        animation.isRemovedOnCompletion = false
//        animation.fillMode = kCAFillModeForwards
        animation.repeatCount = HUGE
        layer.add(animation, forKey: "超級灣")
    }
    
    func 弧度(_ layer:CALayer,_ start:CGPoint ,_ end:CGPoint ,high:CGFloat) {
        let control = CGPoint(x: (start.x + end.x)/2, y: -high)
        let animation = CAKeyframeAnimation(keyPath: "position")
        let path = CGMutablePath()
        path.move(to: start)
        path.addQuadCurve(to: end, control: control)
        animation.path = path
        animation.timingFunctions = [CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)]
        animation.duration = 2
        animation.repeatCount = HUGE
        layer.add(animation, forKey: "超級灣")
    }
}
