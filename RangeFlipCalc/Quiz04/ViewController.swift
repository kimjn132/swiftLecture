//
//  ViewController.swift
//  Quiz04
//
//  Created by Anna Kim on 2022/12/03.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var tfNum1: UITextField!
    
    
    @IBOutlet weak var tfNum2: UITextField!
    
    @IBOutlet weak var lblCheck: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblCheck.text = ""
        
    }
    
    
    
    
    @IBAction func btnCalc(_ sender: UIButton) {
        
        
        //입력을 안하면 기본값으로 0으로 대체하여 계산한다.
            //사용자가 입력하면 tfNum1쓰고, 안쓰면 0으로
        let numNum1 = Int(tfNum1.text!) ?? 0
        let numNum2 = Int(tfNum2.text!) ?? 0
        
        //숫자 크기 비교하여 정의하기
            //기본 정상 크기
        var num1st: Int = numNum1
        var num2nd: Int = numNum2
            //큰 값이 앞으로 오면 뒤집어주기
        if numNum1 > numNum2{
            num1st = numNum2
            num2nd = numNum1
        }
        
        var sum: Int = 0
        
     
                for i in num1st...num2nd {
                    sum += i
                    
                }
                lblCheck.text = "합계는 \(sum)입니다."
            }
        }
        
        
        
        
        
        
        


