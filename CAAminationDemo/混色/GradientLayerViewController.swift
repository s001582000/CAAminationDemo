//
//  GradientLayerViewController.swift
//  CAAminationDemo
//
//  Created by 梁雅軒 on 2017/10/27.
//  Copyright © 2017年 zoaks. All rights reserved.
//

import UIKit

class GradientLayerViewController: UIViewController {
    @IBOutlet weak var btnChange: UIButton!
    @IBOutlet weak var tfMessage: UITextField!
    @IBOutlet weak var lblMessage: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        gradientText(finalLabel: lblMessage)
        btnOnClick(btnChange)
    }

    @IBAction func btnOnClick(_ sender: UIButton) {
        lblMessage.text = tfMessage.text
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func gradientText(finalLabel:UILabel) {
        let tempView = UIView(frame: finalLabel.bounds)
        //混色layer加到tempView
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = tempView.bounds
        tempView.layer.addSublayer(gradientLayer)
        gradientLayer.colors = [UIColor.red.cgColor,UIColor.orange.cgColor,UIColor.yellow.cgColor,UIColor.green.cgColor,UIColor.blue.cgColor]
        
        gradientLayer.startPoint = CGPoint.zero
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        
        //view to image
        UIGraphicsBeginImageContextWithOptions(tempView.frame.size, false, UIScreen.main.scale)
        if let context = UIGraphicsGetCurrentContext(){
            tempView.layer.render(in: context)
            let img = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            //把顏色塞進去
            finalLabel.textColor = UIColor(patternImage: img!)
        }
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
