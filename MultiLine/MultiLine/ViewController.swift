//
//  ViewController.swift
//  MultiLine
//
//  Created by Anna Kim on 2022/12/09.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var thInput: UITextField!
    @IBOutlet weak var tvResult: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tvResult.isEditable = false //readonly
    }

    
    
    @IBAction func btnAppend(_ sender: UIButton) {
        let textCheck = thInput.text!.trimmingCharacters(in: .whitespaces)
        if !textCheck.isEmpty{
            tvResult.text += textCheck + "\n" //누적 +=
            
        }
        thInput.text = ""
    }
    
    
    

}

