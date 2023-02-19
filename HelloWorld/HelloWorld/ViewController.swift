//
//  ViewController.swift
//  HelloWorld
//
//  Created by Anna Kim on 2022/12/02.
//

//화면 뜨기 전
import UIKit
//UIVIewcontroller가 ViewController 상속
class ViewController: UIViewController {

    //property
    //outlet: 화면과 소스를 연결시켜준다는 의미
    //weak: 화면 그냥 닫을 때 메모리 금방 없애준다는 의미
    @IBOutlet weak var lblHelloWorld: UILabel!
    
    
    //상속
        //func: 메소드 // viewDidLoad: 화면이 뜨기 전에 실행되는 역할
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblHelloWorld.text = "안녕하세요!"
    }
//화면 뜨기 시작

}

