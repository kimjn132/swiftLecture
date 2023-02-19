//
//  ViewController.swift
//  Quiz02
//
//  Created by Anna Kim on 2022/12/03.
//

import UIKit

class ViewController: UIViewController {
    //! >> optional, null값 가능
    @IBOutlet weak var tfNum1: UITextField!
    @IBOutlet weak var tfNum2: UITextField!
    @IBOutlet weak var tfAddition: UITextField!
    @IBOutlet weak var tfSubtraction: UITextField!
    @IBOutlet weak var tfMultiplication: UITextField!
    @IBOutlet weak var tfMean: UITextField!
    @IBOutlet weak var tfRemainder: UITextField!

    @IBOutlet weak var lblWarning: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //덧셈결과는 사용자가 클릭 못하게(storyboard에서 editable unclick 아님 여기 소스에서)
        lblWarning.text = ""
        tfAddition.isUserInteractionEnabled = false //readonly
        tfSubtraction.isUserInteractionEnabled = false //readonly
        tfMultiplication.isUserInteractionEnabled = false //readonly
        tfMean.isUserInteractionEnabled = false //readonly
        tfRemainder.isUserInteractionEnabled = false //readonly
    }
    
    
    @IBAction func btnCalc(_ sender: UIButton) {
        //tf에 숫자만 들어갔는지 확인
        //method1
        //        if tfNum1.text?.count == 0 || tfNum2.text?.count == {
        //            //message
        //        }
        
        
        //method2
            //사용자가 (실수로)입력한 스페이스바 제거하는 작업
        if tfNum1.text!.trimmingCharacters(in: .whitespaces).isEmpty || tfNum2.text!.trimmingCharacters(in: .whitespaces).isEmpty{
            //숫자 외 문자 입력할 경우
            lblWarning.text = "숫자를 입력 하세요"
        }else{
            //정상입력할 경우 계산
            tfAddition.text = String(Int(tfNum1.text!)! + Int(tfNum2.text!)!)
            tfSubtraction.text = String(Int(tfNum1.text!)! - Int(tfNum2.text!)!)
            tfMultiplication.text = String(Int(tfNum1.text!)! * Int(tfNum2.text!)!)
            
            
            //분모가 0인 경우 check
            if tfNum2.text == "0"{
                tfMean.text = "계산 불가"
                tfRemainder.text = "계산 불가"
            }else{
                tfMean.text = String(Int(tfNum1.text!)! / Int(tfNum2.text!)!)
                tfRemainder.text = String(Int(tfNum1.text!)! % Int(tfNum2.text!)!)
                lblWarning.text = "계산이 완료 되었습니다."
            }
        }
        
        
        
        

      
        
        
    }//viewController
    
    
    //키보드 내리기
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //self == java의 this
        self.view.endEditing(true)
    }
}
