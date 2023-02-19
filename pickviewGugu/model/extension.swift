//
//  extension.swift
//  pickviewGugu
//
//  Created by Anna Kim on 2022/12/14.
//

import Foundation
import UIKit

extension ViewController: UIPickerViewDataSource{
    
    //picker 외형
    //pickerview의 컬럼개수
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return pickerViewColumn
    }
    //picker의 raw넣기
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return maxArrayNum
    }
    
    
}


extension ViewController: UIPickerViewDelegate{
    
    
    
    
    
    
    //구구단 1~9까지 picker에 보여주기
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(numGu[row])+"단"
    }

    
    
        
        func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
                lblDan.text = String(numGu[row]) + "단"
                selectRow = row
            //lblResult.text = numGuArray[row]
            }
    
    func gugudan(firstNum: Int){
        for i in 1...9 {
            lblResult.text! += "\(firstNum) X \(i) = \(String.init(format: "%2d",(firstNum*i))) \n"
            
         

        }
    }
        
    }
    
    
    
    

    

