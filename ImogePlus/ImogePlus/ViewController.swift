//
//  ViewController.swift
//  ImogePlus
//
//  Created by Anna Kim on 2022/12/03.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblImoge: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblImoge.text = ""
    }

    
    @IBAction func btnSmile(_ sender: UIButton) {
        
        lblImoge.text! += "😀"
        
    }
    
}

