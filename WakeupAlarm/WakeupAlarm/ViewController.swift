//
//  ViewController.swift
//  WakeupAlarm
//
//  Created by Anna Kim on 2022/12/16.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblCurrentTime: UILabel!
    @IBOutlet weak var lblUpdateTime: UILabel!
    
    let interval = 1.0 // 1second
    let timeSelector: Selector = #selector(ViewController.updateTime)   //object 에서는 #을 사용한다.(메서드나 함수 앞에)
    
    
    var setDate = ""
    var nowDate = ""
    var timecount = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
        
        alarmOn()
    }//viewdidload


    
    @IBAction func datePicker(_ sender: UIDatePicker) {
        
        let datePickerView = sender // NS:Next Step, 스티브잡스
        let formatter = DateFormatter()
        
        formatter.locale = Locale(identifier: "ko")
        formatter.dateFormat = "yyyy-MM-dd EEE a hh:mm:ss" //EEE - 요일 , a - am/pm, 24시간 - HH:mm:ss
        
        
        lblUpdateTime.text = "선택시간 : \(formatter.string(from: datePickerView.date))"  //Date - swift 날짜 타입. // Int() or as 사용
        
        
        formatter.dateFormat = "a hh:mm"
        setDate = formatter.string(from: datePickerView.date)

    }//datePicker
    
    @objc func updateTime(){
        //instance
        //object-c에서 가져온 애들
        
        timecount += 1
        
        let date: NSDate = NSDate() // NS:Next Step, 스티브잡스
        let formatter = DateFormatter()
        
        formatter.locale = Locale(identifier: "ko")
        formatter.dateFormat = "yyyy-MM-dd EEE a hh:mm:ss" //EEE - 요일 , a - am/pm, 24시간 - HH:mm:ss

        
        lblCurrentTime.text = "현재시간 : \(formatter.string(from: date as Date))"  //Date - swift 날짜 타입. // Int() or as 사용

        formatter.dateFormat = "a hh:mm"
        nowDate = formatter.string(from: date as Date)
        
        
        if setDate == nowDate {
            if timecount % 2 == 0{
//                view.backgroundColor = UIColor.white
                // 간결하게 바뀜
                view.backgroundColor = .orange
                
            }else{
                view.backgroundColor = .gray
            }
        }else{
            view.backgroundColor = .white
        }

        // 같은 시간이지만 네 알겠습니다. 버튼 누르면 alert창 다시 안뜨게 하기
        
        
    }//updateTime
    
    
    func alarmOn(){
        
       
        let testAlert = UIAlertController(title: "알림", message: "설정된 시간입니다 !!!", preferredStyle: .alert)
            
            //back button, UIAlertAction 설정, handler:nil이므로 그냥 아무 액션 없이 사라짐
        let actionDefault = UIAlertAction(title: "네, 알겠습니다.", style: .cancel, handler: nil)
            
        testAlert.view.subviews.first?.subviews.first?.subviews.first?.backgroundColor = UIColor.yellow
            
        
            //UIAlertController에 UIAlertAction 추가하기
            testAlert.addAction(actionDefault)
            
            //위에 정의한 것 최종적으로 show
            present(testAlert, animated: true)

    }//alarmOn

}//viewcontroller

