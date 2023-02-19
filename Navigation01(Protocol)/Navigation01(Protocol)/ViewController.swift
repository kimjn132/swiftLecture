//
//  ViewController.swift
//  Navigation
//
//  Created by Anna Kim on 2022/12/18.
//

import UIKit

class ViewController: UIViewController {

    //flutter >> initstate(변하는 것만 잡아준다. outlet은)
    @IBOutlet weak var tfMessage: UITextField!
    @IBOutlet weak var imgView: UIImageView!
    
    
    let imgOn = UIImage(named: "lamp_on.png")
    let imgOff = UIImage(named: "lamp_off.png")
    var isOn = true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imgView.image = imgOn
        
    }//viewdidload(처음 한번 초기화면 실행)-앱을 끄고 다시 실행하기 전까지 다시 실행 안됨

    //segue 연결된 것은 button 따로 메소드 안준다. 자체 action 기능이 있다.
    
    
    //segue를 통해 사용하는 것(상속받아서 쓰는 함수)
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //instance(segue)
        let editViewController = segue.destination as! EditViewController //class
        
        if segue.identifier == "editBarButton"{
            editViewController.textWayValue = "Segue: Use Bar Button!"
        }else{
            editViewController.textWayValue = "Segue: Use Button!"
        }
        
        //static
        MessageInfo.message = tfMessage.text!
        
    }//prepare(segue)
    
    
    //중요하다1!!!
    override func viewWillAppear(_ animated: Bool) {
        //2번째 화면에서 입력한 데이터 1번째 화면으로 보여주기
        tfMessage.text = MessageInfo.message
        if MessageInfo.isOn{
            imgView.image = imgOn
        }else{
            imgView.image = imgOff
        }
    }//다른화면 실행하고 다시 실행할 때 
    

}

