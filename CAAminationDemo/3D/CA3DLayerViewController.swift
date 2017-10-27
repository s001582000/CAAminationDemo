//
//  CA3DLayerViewController.swift
//  CAAminationDemo
//
//  Created by 梁雅軒 on 2017/10/26.
//  Copyright © 2017年 zoaks. All rights reserved.
//

import UIKit

class CA3DLayerViewController: UIViewController {
    var angel = -CGFloat.pi/4
    var count = 1
    override func viewDidLoad() {
        super.viewDidLoad()
        var pt = CATransform3DIdentity
        pt.m34 = -1/500
        self.view.layer.sublayerTransform = pt
        var c1t = CATransform3DIdentity
        c1t = CATransform3DTranslate(c1t, -100, 0, 0)
        c1t = CATransform3DRotate(c1t, angel, 1, 0, 0)
        c1t = CATransform3DRotate(c1t, angel, 0, 1, 0)
        let cube = self.cube(transform: c1t)
        self.view.layer.addSublayer(cube)
        
        self.view.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(panOnClick)))
    }
    
    @objc func panOnClick(sender:UIPanGestureRecognizer) {
        let p = sender.translation(in: self.view)
        let angel1 = angel + (p.x / 30)
        let angel2 = angel - (p.y / 30)
        var trans = CATransform3DIdentity
        trans.m34 = -1 / 500
        trans = CATransform3DRotate(trans, angel1, 0, 1, 0)
        trans = CATransform3DRotate(trans, angel2, 1, 0, 1)
        self.view.layer.sublayerTransform = trans
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func face(transform:CATransform3D,color:CGColor) -> CALayer {
        let layer = CALayer()
        if count == 7 {
            count = 1
        }
        layer.frame = CGRect(x: -50, y: -50, width: 100, height: 100)
        layer.contents = UIImage(named: "megaman\(count)")?.cgImage
        count += 1
        layer.backgroundColor = color
//        layer.backgroundColor = UIColor(red:CGFloat(arc4random() % 255)/255.0, green: CGFloat(arc4random() % 255)/255.0, blue: CGFloat(arc4random() % 255)/255.0, alpha: 1).cgColor
        layer.transform = transform
        return layer
        
    }
    
    func cube(transform:CATransform3D) -> CALayer {
        let cube = CATransformLayer()
        
        var ct = CATransform3DMakeTranslation(0, 0, 50)
        cube.addSublayer(face(transform: ct, color: UIColor.red.cgColor))
        
        ct = CATransform3DMakeTranslation(50, 0, 0)
        ct = CATransform3DRotate(ct, .pi/2, 0, 1, 0)
        cube.addSublayer(face(transform: ct,color: UIColor.yellow.cgColor))
        
        ct = CATransform3DMakeTranslation(0, -50, 0)
        ct = CATransform3DRotate(ct, .pi/2, 1, 0, 0)
        cube.addSublayer(face(transform: ct,color: UIColor.orange.cgColor))
        
        ct = CATransform3DMakeTranslation(0, 50, 0)
        ct = CATransform3DRotate(ct, .pi/2, 1, 0, 0)
        cube.addSublayer(face(transform: ct,color: UIColor.blue.cgColor))
        
        ct = CATransform3DMakeTranslation(-50, 0, 0)
        ct = CATransform3DRotate(ct, .pi/2, 0, 1, 0)
        cube.addSublayer(face(transform: ct,color: UIColor.black.cgColor))
        
        ct = CATransform3DMakeTranslation(0, 0, -50)
        ct = CATransform3DRotate(ct, .pi, 0, 1, 0)
        cube.addSublayer(face(transform: ct,color: UIColor.brown.cgColor))
        
        let contentSize = self.view.frame.size
        cube.position = CGPoint(x: contentSize.width/2, y: contentSize.height/2)
        cube.transform = transform
        return cube
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
