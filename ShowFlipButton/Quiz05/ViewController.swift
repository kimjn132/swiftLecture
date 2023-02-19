//
//  ViewController.swift
//  Quiz05
//
//  Created by Anna Kim on 2022/12/03.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var lblText: UILabel!
    
    //홀짝수를 위함 (전역변수)
    var count: Int = 0
    
    //true/false
    var status = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    
    @IBAction func btnName(_ sender: UIButton) {
        

        //Method1: 라벨 글자로 비교
        
//        if lblText.text == "Welcome!"{
//            lblText.text = "Welcome! Kenny"
//        }else{
//            lblText.text = "Welcome!"
//        }
        
        //Method2: 홀 짝수 구분
//        if count % 2 == 0{
//            //첫 클릭: 짝수
//            lblText.text = "Welcome! Kenny"
//        }else{
//            lblText.text = "Welcome!"
//        }
//        count += 1  //java spring movie 확인
//
        //true or false 구분: Status 변수
        if status{
            lblText.text = "welcome! kenny"
            //status가 true로 들어왔으므로 false으로 바꿔줘야함
            status = false
        }else{
            lblText.text = "welcome"
            status = true
        }
        
    }
    
    
    
    

}

