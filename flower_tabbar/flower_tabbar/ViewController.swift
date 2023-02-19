//
//  ViewController.swift
//  flower_tabbar
//
//  Created by Anna Kim on 2022/12/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    
    @IBAction func btnButton(_ sender: UIButton) {
        tabBarController?.selectedIndex = 1
    }
    
    @IBAction func btnTimer(_ sender: UIButton) {
        tabBarController?.selectedIndex = 2
    }
    
    
    @IBAction func btnPageControl(_ sender: UIButton) {
        tabBarController?.selectedIndex = 3
    }
    
}

