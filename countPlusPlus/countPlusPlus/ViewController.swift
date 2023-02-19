//
//  ViewController.swift
//  countPlusPlus
//
//  Created by Anna Kim on 2022/12/04.
//

import UIKit

class ViewController: UIViewController {

    //property, field
    @IBOutlet weak var lblDisplay: UILabel!
    
    var arrNumber = ["10","20","25","35","40","51","61","71","81","91"]
    
    // 상태변수: 화면이 지금 어떤 상태인지 알려주는 변수(예시: 전구가 켜져있는지 꺼져있는지)
    //처음 실행될 때 0
    var indexState = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //처음 화면에서 10부터 보여준다.
        //처음에는 0, 다음 클릭 땐 1로 변하므로 >>  배열이 하나씩 올라간다.
        lblDisplay.text = arrNumber[indexState]
    }
//여기까지 한번 실행된다.
    

    @IBAction func btnIncrease(_ sender: UIButton) {
        //클릭하면 20,...배열 안 숫자를 하나씩 보여주기
        indexState += 1
        if indexState >= arrNumber.count{
        //여기까지
        //lblDisplay.text = "X"
            
            //무한반복
            indexState = 0
            
            
        }else{
            lblDisplay.text = arrNumber[indexState]
        }
        
    }
    
    
    
    
}

