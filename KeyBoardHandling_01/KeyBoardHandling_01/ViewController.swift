//
//  ViewController.swift
//  KeyBoardHandling_01
//
//  Created by Anna Kim on 2022/12/24.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var tfUserId: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setKeyboardEvent() //keyboard Handling
    }

    func setKeyboardEvent(){
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillAppear(_ :)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillDisAppear(_ :)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
//화면 아무곳이나 누르면 키보드 내려가기
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @objc func keyboardWillAppear(_ sender: NotificationCenter){
        self.view.frame.origin.y = -150
    }
    
    @objc func keyboardWillDisAppear(_ sender: NotificationCenter){
        self.view.frame.origin.y = 0.0
    }
}

