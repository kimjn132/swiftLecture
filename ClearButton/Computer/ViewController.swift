//
//  ViewController.swift
//  Computer
//
//  Created by Anna Kim on 2022/12/02.
//

import UIKit
//command 누르고 마우스 갖다 대면 class 범위를 보여준다.
class ViewController: UIViewController {

    
    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfSize: UITextField!
    @IBOutlet weak var tfWeight: UITextField!
    @IBOutlet weak var tfBag: UITextField!
    @IBOutlet weak var tfColor: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func btnOK(_ sender: UIButton) {
        var pcName: String = "맥북프로"
        var pcSize: Int = 16
        var pcWeight: Double = 2.56
        var pcBag: Bool = false
        var pcColor: Character = "백"

        tfName.text = pcName
        tfSize.text = String(pcSize)
        tfWeight.text = String(pcWeight)
        tfBag.text = String(pcBag)
        //character도 string으로 바꿔줘야됨
        tfColor.text = String(pcColor)
    }
    //type: Any는 메모리를 많이 쓴다.
    //클릭할 때 모양이 바뀌면 outlet쪽에다가도 연결 시켜줘야 한다.
    @IBAction func btnClear(_ sender: UIButton) {
        tfName.text = ""
        tfSize.text?.removeAll()
        tfWeight.text?.removeAll()
        tfBag.text?.removeAll()
        //character도 string으로 바꿔줘야됨
        tfColor.text?.removeAll()
    }
    
}//ViewController

