//
//  ViewController.swift
//  TextName
//
//  Created by Anna Kim on 2022/12/03.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var lblName: UILabel!
    
    @IBOutlet weak var lblWrite: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblName.text = ""
        lblWrite.text = ""
    }

    
    @IBAction func btnSend(_ sender: UIButton) {
     
        lblWrite.text! = lblName.text!
    }
    
    
    @IBAction func btnClear(_ sender: UIButton) {
        
        lblName.text = ""
        lblWrite.text?.removeAll()
    }
    
}

