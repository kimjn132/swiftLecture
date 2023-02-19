//
//  ViewController.swift
//  ColorAlarm
//
//  Created by Anna Kim on 2022/12/11.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var lblCurrentTime: UILabel!
    @IBOutlet weak var lblPickerTime: UILabel!
    
    let interval = 1.0 // 1second
    let timeSelector: Selector = #selector(ViewController.updateTime)   //object 에서는 #을 사용한다.(메서드나 함수 앞에)
    
    var alarmTime : String = ""
    var count = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // async type 정의,(touchscree, GPS 비동기방식 사용)
        // ios(object-C언어) >> swift에서 물어보려면 how? :
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
        //self : ViewController
        //selector: object-C에서 사용하는 것
        
    }

    //selected time
    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        
        let datePickerView = sender // NS:Next Step, 스티브잡스
        let formatter = DateFormatter()
       
        formatter.locale = Locale(identifier: "ko")
        formatter.dateFormat = "yyyy-MM-dd EEE a hh:mm:ss" //EEE - 요일 , a - am/pm, 24시간 - HH:mm:ss
        lblPickerTime.text = "선택시간 : \(formatter.string(from: datePickerView.date))"  //Date - swift 날짜 타입. // Int() or as 사용
        
        //알람
        formatter.dateFormat = "hh:mm"  //formatter 양식을 바꿔준다.
        alarmTime = formatter.string(from: datePickerView.date) //전역변수에서 지정한 alarmTime
        
       
    }
    
    
    //실시간 time
    
    @objc func updateTime(){
        //instance
            //object-c에서 가져온 애들
        let date: NSDate = NSDate() // NS:Next Step, 스티브잡스
        let formatter = DateFormatter()
        
        
        
        formatter.locale = Locale(identifier: "ko")
        formatter.dateFormat = "yyyy-MM-dd EEE a hh:mm:ss" //EEE - 요일 , a - am/pm, 24시간 - HH:mm:ss
        lblCurrentTime.text = "현재시간 : \(formatter.string(from: date as Date))"  //Date - swift 날짜 타입. // Int() or as 사용
        
        //알람 설정부
        formatter.dateFormat = "hh:mm"
        let currentTime = formatter.string(from: date as Date)
        
        
      
            
            if alarmTime == currentTime{
                count += 1
                if count % 2 == 1{
                    view.backgroundColor = UIColor.red
                }else{
                    view.backgroundColor = UIColor.blue
                }
            }else{
                view.backgroundColor = UIColor.white        //시간 안맞으면 화이트 배경 
            }
   
        
    }
    
    
    
    
    
    
    
    

}//viewcontroller

