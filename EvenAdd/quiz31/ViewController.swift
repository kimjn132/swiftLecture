//
//  ViewController.swift
//  quiz31
//
//  Created by Anna Kim on 2022/12/03.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var tfNum1: UITextField!
    @IBOutlet weak var tfNum2: UITextField!
    @IBOutlet weak var tfResult: UITextField!
    
    @IBOutlet weak var tfMessage: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tfMessage.text=""
    }


    @IBAction func btnCalc(_ sender: UIButton) {
        
        let numNum1:Int = Int(tfNum1.text!)!
        let numNum2:Int = Int(tfNum2.text!)!

        
        if Int(numNum1) % 2 == 0 && Int(numNum2) % 2 == 0 {
            tfResult.text = String(numNum1 + numNum2)
            tfMessage.text = "계산완료"
            
        }else{
            tfMessage.text = "짝수가 아닙니다."
        }
        
     
        
    }
    
    
    
    
    
}

