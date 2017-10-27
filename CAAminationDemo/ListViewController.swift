//
//  ListViewController.swift
//  CAAminationDemo
//
//  Created by 梁雅軒 on 2017/9/25.
//  Copyright © 2017年 zoaks. All rights reserved.
//

import UIKit

class ListViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var arrData = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        arrData.append("Basic")
        arrData.append("煙火")
        arrData.append("KeyFrame")
        arrData.append("應用")
        arrData.append("3D")
        arrData.append("混色")
        
    }
    
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "Cell")
        cell.textLabel?.text = arrData[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if arrData[indexPath.row] == "Basic" {
            navigationController?.pushViewController(BaseAnimationViewController(), animated: true)
        }else if arrData[indexPath.row] == "煙火"{
            navigationController?.pushViewController(FireViewController(), animated: true)
        } else if arrData[indexPath.row] == "KeyFrame"{
            navigationController?.pushViewController(KeyFrameViewController(), animated: true)
        } else if arrData[indexPath.row] == "應用" {
            navigationController?.pushViewController(ApplyViewController(), animated: true)
        } else if arrData[indexPath.row] == "3D" {
            navigationController?.pushViewController(CA3DLayerViewController(), animated: true)
        } else if arrData[indexPath.row] == "混色" {
            navigationController?.pushViewController(GradientLayerViewController(), animated: true)
        }
    }

}


