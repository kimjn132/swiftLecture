//
//  EditViewController.swift
//  Navigation
//
//  Created by Anna Kim on 2022/12/18.
//

import UIKit

// 메세지 완성되었을 때 사용하는 용도
protocol EditDelegate{
    func didMessageEditDone(_ controller: EditViewController, message: String)
    func didImageOnOffDone(_ controller: EditViewController, isOn: Bool)
}


class EditViewController: UIViewController {

    //두번째 화면은 항상 새로 나오는 화면
    //outlet은 소프트웨어가 제어할 수 있는 부분
    //action는 사용자가 제어하는 부분
    
    //property
    @IBOutlet weak var lblWay: UILabel!
    @IBOutlet weak var tfMessage: UITextField!
    @IBOutlet weak var lblOnOff: UILabel!
    @IBOutlet weak var swIsOn: UISwitch!
    
    //viewcontroller 인스턴스를 통해 이곳에 값을 넣어놓고 >>viddidload에 실행시킴
    var textWayValue: String = ""

    var textMessage: String = ""
    

    var isOn: Bool = Message.isOn
    
    var delegate: EditDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        lblWay.text = textWayValue
        
        //static
//        tfMessage.text = Message.message
        
        tfMessage.text = textMessage
        
        //전구>>이 부분 때문에 데이터가 유지된 것처럼 보이나, 데이터는 사라지고 인스턴스로 새롭게 화면 구현 한 것이다.
        swIsOn.isOn = isOn
        if isOn{
            lblOnOff.text = "On"
        }else{
            lblOnOff.text = "Off"
        }
    }
    
    
    @IBAction func btnDone(_ sender: UIButton) {
        if delegate != nil{
            delegate?.didMessageEditDone(self, message: tfMessage.text!)
            delegate?.didImageOnOffDone(self, isOn: isOn)
        }
        
//        Message.message = tfMessage.text!
//        Message.isOn = isOn
//        //navigation controller 화면(storyboard에서 확인)은 각 화면에 다 떠있다고 생각하면 된다.
        
        
//        delegate?.didMessageEditDone(self, message: tfMessage.text!)
//        delegate?.didImageOnOffDone(self, isOn: isOn)
        
        navigationController?.popViewController(animated: true) //지금 뜬 화면 사라짐 pop!!, 메모리에서 사라짐
    }
    
    
    @IBAction func swImageOnOff(_ sender: UISwitch) {
        if sender.isOn{
            isOn = true
            lblOnOff.text = "On"
        }else{
            isOn = false
            lblOnOff.text = "Off"
        }
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
