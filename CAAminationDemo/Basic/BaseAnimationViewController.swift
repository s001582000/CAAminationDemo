//
//  BaseAnimationViewController.swift
//  CAAminationDemo
//
//  Created by 梁雅軒 on 2017/9/25.
//  Copyright © 2017年 zoaks. All rights reserved.
//

import UIKit
//let baseY = UIApplication.shared.statusBarFrame.size.height + UINavigationBar().frame.size.height
class BaseAnimationViewController: UIViewController {
    @IBOutlet weak var tfMessage: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //對x軸旋轉
        let layer1 = initLayer(frame: CGRect(x: 20, y: 20, width: 40, height: 40))
        view.layer.addSublayer(layer1)
        
        let xAnimation = CABasicAnimation(keyPath: "transform.rotation.x")
        xAnimation.toValue = 2 * Double.pi
        xAnimation.duration = 1
        xAnimation.autoreverses = true
        xAnimation.repeatCount = HUGE
        layer1.add(xAnimation, forKey: "x")
        
        //對y軸旋轉
        let layer2 = initLayer(frame: CGRect(x: 80, y: 20, width: 40, height: 40))
        view.layer.addSublayer(layer2)
        
        let yAnimation = CABasicAnimation(keyPath: "transform.rotation.y")
        yAnimation.toValue = 2 * Double.pi
        yAnimation.duration = 1
        yAnimation.autoreverses = true
        yAnimation.repeatCount = HUGE
        layer2.add(yAnimation, forKey: "y")
        
        //對z軸旋轉
        let layer3 = CALayer()
        layer3.frame = CGRect(x: 140, y: 20, width: 40, height: 40)
        layer3.backgroundColor = UIColor.red.cgColor
        view.layer.addSublayer(layer3)
        
        let zAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        zAnimation.toValue = 2 * Double.pi
        zAnimation.duration = 1
        zAnimation.repeatCount = HUGE
        layer3.add(zAnimation, forKey: "z")
        
        //對x及z軸旋轉
        let layer4 = CALayer()
        layer4.frame = CGRect(x: 20, y: 80, width: 40, height: 40)
        layer4.backgroundColor = UIColor.red.cgColor
        view.layer.addSublayer(layer4)
        
        layer4.add(xAnimation, forKey: "x")
        layer4.add(zAnimation, forKey: "z")
        
        //對x及y軸旋轉
        let layer5 = CALayer()
        layer5.frame = CGRect(x: 80, y: 80, width: 40, height: 40)
        layer5.backgroundColor = UIColor.red.cgColor
        view.layer.addSublayer(layer5)
        layer5.add(xAnimation, forKey: "x")
        layer5.add(yAnimation, forKey: "y")
        
        //對z及y軸旋轉
        let layer6 = CALayer()
        layer6.frame = CGRect(x: 140, y: 80, width: 40, height: 40)
        layer6.backgroundColor = UIColor.red.cgColor
        view.layer.addSublayer(layer6)
        
        layer6.add(zAnimation, forKey: "z")
        layer6.add(yAnimation, forKey: "y")
        
        //360度
        let layer車子 = addImage(name: "layer1.png")
        layer車子?.position = self.view.center
        layer車子?.add(zAnimation, forKey: "x")
        self.view.layer.addSublayer(layer車子!)
        
        let layer外圈 = addImage(name: "layer2.png")
        layer外圈?.position = self.view.center
        layer外圈?.add(yAnimation, forKey: "y")
        self.view.layer.addSublayer(layer外圈!)
        
        let layer內圈 = addImage(name: "layer3.png")
        layer內圈?.position = self.view.center
        let animationX = CABasicAnimation(keyPath: "transform.rotation.x")
        animationX.toValue = -2 * Double.pi
        animationX.duration = 1
        animationX.autoreverses = true
        animationX.repeatCount = HUGE
        animationX.beginTime = 0.3
        layer內圈?.add(animationX, forKey: "y")
        self.view.layer.addSublayer(layer內圈!)
        
    }
    
    func addImage(name:String) -> CALayer? {
        if let image = UIImage(named: name) {
            let layer = CALayer()
            layer.frame = CGRect(origin: CGPoint.zero, size: image.size)
            layer.contents = image.cgImage
            return layer
        }
        return nil
    }
    
    func initLayer(frame:CGRect) -> CALayer {
        let layer = CALayer()
        layer.frame = frame
        layer.backgroundColor = UIColor.red.cgColor
        layer.cornerRadius = 20
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 1
        return layer
    }
    @IBAction func tfExit(_ sender: UITextField) {
        搖晃(target: sender)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func 搖晃(target:UIView) {
        let layer = target.layer
        let animation = CABasicAnimation(keyPath: "transform.translation.x")
        animation.toValue = 5
        animation.toValue = -5
        animation.autoreverses = true
        animation.duration = 0.1
        animation.repeatCount = 3
        animation.isRemovedOnCompletion = false
        animation.fillMode = kCAFillModeForwards
        layer.borderColor = UIColor.red.cgColor
        layer.borderWidth = 1
        animation.setValue(target, forKey: "targetView")
//        animation.delegate = self
        layer.add(animation, forKey: "上下")
    }
    
}
