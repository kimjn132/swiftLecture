//
//  ViewController.swift
//  AvgGrade
//
//  Created by Anna Kim on 2022/12/04.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var tfKorea: UITextField!
    @IBOutlet weak var tfMath: UITextField!
    @IBOutlet weak var tfEnglish: UITextField!
    @IBOutlet weak var lblResultMessage: UILabel!
    
   //점수 합계
    var tot = 0
    
    //점수 평균
    var avg: Double = 0
    
    //점수 평균에 따른 성적
    var grade: String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblResultMessage.text = ""
    }


    @IBAction func btnCal(_ sender: UIButton) {
        let kor = Int(tfKorea.text!)!
        let math = Int(tfMath.text!)!
        let english = Int(tfEnglish.text!)!
        
        tot = kor + math + english
        avg = Double(tot) / 3
        
        
        grade = avg >= 90 ? "수" :
                avg >= 80 ? "우" :
                avg >= 70 ? "미" :
                avg >= 60 ? "양" : "가"
        
       
        
        guard let kor = tfKorea.text else { return }
        guard let math = tfMath.text else { return }
        guard let english = tfEnglish.text else { return }
        
        if kor.isEmpty || english.isEmpty || math.isEmpty{
            lblResultMessage.text = "숫자를 입력하세요"
            
        }else{
            calcAction(Int(kor)!, Int(english)!, Int(math)!)
        }
        
    }
   
    func calcAction(_ kor: Int, _ english: Int, _ math: Int){
        lblResultMessage.text = "평균은 \(String(format:"%.2f",avg))이고 등급은 \(grade)입니다."
    }
    
    
    
    
}

