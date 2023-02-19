//
//  ViewController.swift
//  TabBar
//
//  Created by Anna Kim on 2022/12/18.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func btnGoImageView(_ sender: UIButton) {
        tabBarController?.selectedIndex = 1
    }
    
    
    
    @IBAction func btnGoDatePicker(_ sender: UIButton) {
        tabBarController?.selectedIndex = 2
    }
    
    //index번호는 tabbar 순서대로..

}

