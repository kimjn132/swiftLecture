//
//  ViewController.swift
//  SwitchCalculator
//
//  Created by Anna Kim on 2022/12/10.
//

import UIKit

class ViewController: UIViewController {

    //input
    @IBOutlet weak var tfNum1: UITextField!
    @IBOutlet weak var tfNum2: UITextField!
    
    //result
    @IBOutlet weak var tfSum: UITextField!
    @IBOutlet weak var tfSub: UITextField!
    @IBOutlet weak var tfMulti: UITextField!
    @IBOutlet weak var tfDivide: UITextField!
    
    //switch
    @IBOutlet weak var swAddition: UISwitch!
    @IBOutlet weak var swSubtraction: UISwitch!
    @IBOutlet weak var swMultiplication: UISwitch!
    @IBOutlet weak var swDivision: UISwitch!
    
    
    // 계산 결과값 저장
    var storeAdd: String?
    var storeSubtract: String = ""
    var storeMultiply: String = ""
    var storeDivide: String = ""
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    //button zone
    @IBAction func btnCalc(_ sender: UIButton) {
        //숫자는 guardlet보다 이게 편하다.
        let firstNum = Int(tfNum1.text!) ?? 0
        let secondNum = Int(tfNum2.text!) ?? 0
        
        calculate(first: firstNum, second: secondNum)
        
        // switch 초기화
       // swEnable()
        

        
    }
    
    func swEnable(){
        swAddition.isOn = true
        swSubtraction.isOn = true
        swMultiplication.isOn = true
        swDivision.isOn = true
    }
    
    func calculate(first: Int, second: Int){
        storeAdd = String(first + second)
        storeSubtract = String(first - second)
        storeMultiply = String(first * second)
        
        if second == 0{
            storeDivide = "Impossible"
        }else{
            storeDivide = String(Double(first) / Double(second))
        }
        
        
        displayResult()
    }
    
    
    
    
    
    
    
    func displayResult(){
       
        
        if swAddition.isOn{
            tfSum.text = storeAdd
        }
        
        if swSubtraction.isOn{
            tfSub.text = storeSubtract
        }
        
        if swMultiplication.isOn{
            tfMulti.text = storeMultiply
        }
        
        if swDivision.isOn{
            tfDivide.text = storeDivide
        }
        
    }
    
    
    
    @IBAction func btnClear(_ sender: UIButton) {
        tfNum1.text?.removeAll()
        tfNum2.text = ""
        storeAdd = ""
        storeSubtract = ""
        storeMultiply = ""
        storeDivide = ""
        
        displayResult()
        
        // switch 초기화
       // swEnable()
        
        // clean되면 tfnum1에 cursor가 간다.
        tfNum1.becomeFirstResponder()
    }
    
    
    
    //switch zone: 스위치가 꺼진 상태에서 계산하면 계산 결과가 나와버림..if 문에서 self/sender 중 어떤 것??
    @IBAction func swSum(_ sender: UISwitch) {
        switch sender.isOn{
        case true:
            tfSum.text = storeAdd
        default:
            tfSum.text = ""
            
        }
    }
    
    
    @IBAction func swSub(_ sender: UISwitch) {
        switch sender.isOn{
        case true:
            tfSub.text = storeSubtract
        case false:
            tfSub.text = ""
            
        }
    }
    
    @IBAction func swMulti(_ sender: UISwitch) {
        switch sender.isOn{
        case true:
            tfMulti.text = storeMultiply
        default:
            tfMulti.text = ""
            
        }
    }
    
    @IBAction func swDivide(_ sender: UISwitch) {
        switch sender.isOn{
        case true:
            tfDivide.text = storeDivide
        default:
            tfDivide.text = ""
            
        }
    }
    
    
    
    
    //키보드 내리기
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}

