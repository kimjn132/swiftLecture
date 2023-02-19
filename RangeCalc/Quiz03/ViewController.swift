//
//  ViewController.swift
//  Quiz03
//
//  Created by Anna Kim on 2022/12/03.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var tfNum1: UITextField!
    @IBOutlet weak var tfNum2: UITextField!
    
    @IBOutlet weak var lblResult: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


  
    @IBAction func btnCalc(_ sender: UIButton) {
        let num1 = Int(tfNum1.text!)!
        let num2 = Int(tfNum2.text!)!
        
        var sum: Int = 0
        
        for i in num1...num2{
            sum += i
            
        }
        lblResult.text = "범위의 합계는 \(sum)입니다."
        
    }
    
    
}

