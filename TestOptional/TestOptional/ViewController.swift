//
//  ViewController.swift
//  TestOptional
//
//  Created by Anna Kim on 2022/12/03.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var tfData: UITextField!
    @IBOutlet weak var lblMessage: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblMessage.text = ""
    }

    @IBAction func btnOK(_ sender: UIButton) {
        //guardlet방식(최근에 많이 쓰는 방식) >> DB에서 가져올 때 데이터가 없으면 nil로 들어옴
        //! 는 웬만하면 쓰지 않고 guardlet방식을 쓰는 게 좋다.
        //버전 5부터 사용할 수 있는 기능이다.
        guard let check2 = tfData.text else { return }
   
        
        if check2.count == 0{
            lblMessage.text = "데이터를 확인하세요"
        }else{
            lblMessage.text = check2
        }
    }
    
    
    
}

