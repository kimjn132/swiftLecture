//
//  ViewController.swift
//  ThreeImogi
//
//  Created by Anna Kim on 2022/12/03.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var lblImogi: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblImogi.text = ""
    }


    @IBAction func btnSmile(_ sender: Any) {
        lblImogi.text! += "😀"
    }
    
    
    @IBAction func btnTongue(_ sender: Any) {
        lblImogi.text! += "😛"
    }
    
    
    @IBAction func btnAngry(_ sender: Any) {
        lblImogi.text! += "😡"
    }
    
}

