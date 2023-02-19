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
    
    //전역변수
    let imgOn = UIImage(named: "lamp_on.png")
    let imgOff = UIImage(named: "lamp_off.png")
//    var isOn = true
    
    var textWayValue: String = ""
    var textMessage: String = ""
    var isOn: Bool = true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imgView.image = imgOn
        
      
        
    }//viewdidload(처음 한번 초기화면 실행)-앱을 끄고 다시 실행하기 전까지 다시 실행 안됨

    //segue 연결된 것은 button 따로 메소드 안준다. 자체 action 기능이 있다.
    
    
    //segue를 통해 사용하는 것(상속받아서 쓰는 함수)
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //instance(segue)//
        
        
        let editViewController = segue.destination as! EditViewController   //segue통해서 인스턴스 만들면 EditViewController()에서 () 필요 없다.
        
        if segue.identifier == "editBarButton"{
            editViewController.textWayValue = "Segue: Use Bar Button!"
        }else{
            editViewController.textWayValue = "Segue: Use Button!"
        }
        //self는 extension이 있어야 사용 가능하다.
        editViewController.delegate = self
        
        editViewController.textMessage = tfMessage.text!
        
        //static
//        Message.message = tfMessage.text!
//        editViewController.isOn = isOn
//        editViewController.delegate = self
        
    }//prepare(segue)
    
    
//
//    //중요하다1!!! 2번째가 죽고 난 후 다시 1번째로 간다.
    override func viewWillAppear(_ animated: Bool) {
        //2번째 화면에서 입력한 데이터 1번째 화면으로 보여주기
//        tfMessage.text = textMessage
        
//        if isOn{
//            imgView.image = imgOn
//        }else{
//            imgView.image = imgOff
//        }
//
        
    }//다른화면 실행하고 다시 실행할 때
    

}// viewcontroller


//viewwillappear 필요 없다., protocol은 데이터를 주고 죽음(2번째가 1번째를 구성시켜놓고 죽는다.), protocol(보안, static은 보안용으로 사용 불가)
//extension EditViewController: EditDelegate{
//    func didMessageEditDone(_ controller: EditViewController, message: String) {
//        tfMessage.text = message
//    }
//
//    func didImageOnOffDone(_ controller: EditViewController, isOn: Bool) {
//        if isOn{
//            imgView.image = imgOn
//            self.isOn = true //전역변수의 isOn
//        }else{
//            imgView.image = imgOff
//            self.isOn = false
//        }
//    }


// protocol 사용하면 viewwillappear 에 다시 데이터를 담아 줄 필요 없다.
extension ViewController: EditDelegate{
    func didMessageEditDone(_ controller: EditViewController, message: String) {
        tfMessage.text = message
    }
    
    func didImageOnOffDone(_ controller: EditViewController, isOn: Bool) {
        if isOn{
            imgView.image = imgOn
            self.isOn = true //전역변수의 isOn
        }else{
            imgView.image = imgOff
            self.isOn = false
        }
    }
    
}
    
    


