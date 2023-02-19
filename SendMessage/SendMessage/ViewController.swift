//
//  ViewController.swift
//  SendMessage
//
//  Created by Anna Kim on 2022/12/09.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tvContent: UITextView!
    @IBOutlet weak var tfMessage: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func btnSend(_ sender: UIButton) {
        let textCheck = tfMessage.text!.trimmingCharacters(in: .whitespaces)
        
        if !textCheck.isEmpty{
            tvContent.text += textCheck + "\n" //누적 +=
            
        }
        tfMessage.text = ""
    }
    
    
    @IBAction func btnEmoji(_ sender: UIButton) {
      
            
            tfMessage.text! += "🥸"
       
    }
    
    
    
    
}

