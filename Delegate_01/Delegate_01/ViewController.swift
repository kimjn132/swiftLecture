//
//  ViewController.swift
//  Delegate_01
//
//  Created by Anna Kim on 2022/12/10.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfInput: UITextField!
    @IBOutlet weak var lblResult: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tfInput.delegate = self
    }

    @IBAction func btnButton(_ sender: UIButton) {
//        lblResult.text = tfInput.text
        _ = textFieldShouldReturn(tfInput)  //  _는 휴지통. >> 받아서 휴지통으로 보냄, 함수에서도 _
    }
    
    
    

}//ViewController




//tfInput에 리턴 버튼 기능을 알아들을 수 있게 설정해 줘야됨
    //extension하는 이유는 tfInput이 viewController 안에 있기 때문에 그 밖에서 extension없이는 사용 할 수 없다.
//optional method: 아는 놈만 사용해라

extension ViewController: UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        lblResult.text = tfInput.text
        return true
    }
}


