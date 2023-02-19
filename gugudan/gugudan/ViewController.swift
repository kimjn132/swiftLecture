//
//  ViewController.swift
//  gugudan
//
//  Created by Anna Kim on 2022/12/09.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var tfNum: UITextField!
    
    @IBOutlet weak var tvGugu: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tvGugu.isEditable = false //readonly
    }


    @IBAction func btnGugu(_ sender: UIButton) {
        let seq = 1...9
        var num1 = Int(tfNum.text!)!
        let textCheck = tfNum.text!.trimmingCharacters(in: .whitespaces)
        if !textCheck.isEmpty{
            for i in seq{
                
                tvGugu.text += "\(num1) X \(i) = \(num1*i) \n"
            }
        }
        tfNum.text = ""
    }
    
    
    
    
}

