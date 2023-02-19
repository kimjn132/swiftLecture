//
//  ViewController.swift
//  Quiz3
//
//  Created by Anna Kim on 2022/12/03.
//

import UIKit



class ViewController: UIViewController {
    
    
    @IBOutlet weak var tfNum: UITextField!
    
    
    @IBOutlet weak var lblCheck: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        lblCheck.text = ""
        
    }
    
    
    @IBAction func btnCheck(_ sender: UIButton) {
        
        let numNum = Int(tfNum.text!)!
       // let num: Int = Int(numNum!)!
        
        if numNum % 2 == 0{
            lblCheck.text = "입력하신 숫자는 짝수입니다."
        }else{
            lblCheck.text = "입력하신 숫자는 홀수입니다."
        }
        
        
        
        
        
    }
    
}
