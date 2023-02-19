//
//  ViewController.swift
//  AlertActionSheet
//
//  Created by Anna Kim on 2022/12/11.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    //1번째 화면 다음 2번재 화면 나올 때 1번째 화면이 뒤에 있음, 왜냐하면 1번째 화면지우고 다시 띄우는건 시간이 오래 걸린다.(비효율적이다.)
    
    
    
    @IBAction func btnAlert(_ sender: UIButton) {
        // UIAlertController 초기화
        let testAlert = UIAlertController(title: "Title", message: "Message", preferredStyle: .alert)
        
        //back button, UIAlertAction 설정, handler:nil이므로 그냥 아무 액션 없이 사라짐
        let actionDefault = UIAlertAction(title: "Action Default", style: .default, handler: nil)
        let actionDestructive = UIAlertAction(title: "Action Destructive", style: .destructive, handler: {ACTION in
            print("destructive action called")
        })
        let actionCancel = UIAlertAction(title: "Action Cancel", style: .cancel)
        
        //UIAlertController에 UIAlertAction 추가하기
        testAlert.addAction(actionDefault)
        testAlert.addAction(actionDestructive)
        testAlert.addAction(actionCancel)
        
        //위에 정의한 것 최종적으로 show
        present(testAlert, animated: true)
    }
    
    
    @IBAction func btnActionSheet(_ sender: UIButton) {
        // UIAlertController 초기화
        let testAlert = UIAlertController(title: "Title", message: "Message", preferredStyle: .actionSheet)
        
        //back button, UIAlertAction 설정, handler:nil이므로 그냥 아무 액션 없이 사라짐
        let actionDefault = UIAlertAction(title: "Action Default", style: .default, handler: nil)
        let actionDestructive = UIAlertAction(title: "Action Destructive", style: .destructive, handler: {ACTION in
            print("destructive action called")
        })
        let actionCancel = UIAlertAction(title: "Action Cancel", style: .cancel)
        
        //UIAlertController에 UIAlertAction 추가하기
        testAlert.addAction(actionDefault)
        testAlert.addAction(actionDestructive)
        testAlert.addAction(actionCancel)
        
        //위에 정의한 것 최종적으로 show
        present(testAlert, animated: true)
    }
    
    
}// viewcontroller

