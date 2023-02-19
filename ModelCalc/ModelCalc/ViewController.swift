//
//  ViewController.swift
//  ModelCalc
//
//  Created by Anna Kim on 2022/12/10.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfNum1: UITextField!
    @IBOutlet weak var tfNum2: UITextField!
   
    @IBOutlet weak var lblResult: UILabel!
    @IBOutlet weak var lblResultS: UILabel!
    @IBOutlet weak var lblResultM: UILabel!
    @IBOutlet weak var lblResultD: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnCalc(_ sender: UIButton) {
        //instance 생성
        let calculation: Calculation = Calculation()
        
        let result = calculation.add(tfNum1.text, tfNum2.text)
        let result2 = calculation.sub(tfNum1.text, tfNum2.text)
        let result3 = calculation.mul(tfNum1.text, tfNum2.text)
        let result4 = calculation.div(tfNum1.text, tfNum2.text)
        
        lblResult.text = "덧셈 결과는 \(result) 입니다."
        lblResultS.text = "뺄셈 결과는 \(result2) 입니다."
        lblResultM.text = "곱셈 결과는 \(result3) 입니다."
        
        
        if Int(tfNum2.text!)! == 0{
            lblResultD.text="Impossible"
        }else{
            lblResultD.text = "나눗셈 결과는 \(result4) 입니다."
        }
        
        
        //동기 방식 vs 비동기 방식(동시에 처리 가능한 방식 async method)
      // -데이터 가져오는 것은 비동기 방식 사용
        
        
    }
    
}

