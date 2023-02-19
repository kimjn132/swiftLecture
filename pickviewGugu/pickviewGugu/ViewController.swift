//
//  ViewController.swift
//  pickviewGugu
//
//  Created by Anna Kim on 2022/12/14.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var lblDan: UILabel!
    @IBOutlet weak var pkDan: UIPickerView!
    @IBOutlet weak var lblResult: UILabel!
    
    var numGu = [2,3,4,5,6,7,8,9]
    var firstNum = 0
    var selectRow = 0
    var numGuArray : Array<String> = []
    
    //pickerview의 모습
    var maxArrayNum = 0
    //보통 컬럼 두개로 하지 않고, pickerview를 따로 하나씩 만든다.
    let pickerViewColumn = 1
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // pickerView의 raw 개수 (count)
        maxArrayNum = numGu.count
        
        // 배열에 넣어줌
        
        
//            for i in 0..<10{
//
//                let dan = "\(numGu[0]) X \(i) = \(String.init(format: "%2d",(numGu[0]*i))) \n"
//
//                numGuArray.append(dan)
//
//
//            }
//
//        print(numGuArray.)
       
        lblDan.text = "\(numGu[0])"
        //print(lblDan.text)
        gugudan(firstNum: numGu[0])
       
        //extension에서의 메소드를 실행시킴
        pkDan.dataSource = self
        pkDan.delegate = self
        
    }
    
    
    
    
    
}
