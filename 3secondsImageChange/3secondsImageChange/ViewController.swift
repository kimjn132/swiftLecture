//
//  ViewController.swift
//  3secondsImageChange
//
//  Created by Anna Kim on 2022/12/11.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lbltime: UILabel!
    
    @IBOutlet weak var lblImageName: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    
    //image count
    var count = 0
    
    //timestamp count
    var interval = 1.0 // 1second
    
    //time seconds count
    var timecount = 0
    
    var imageName = ["flower_01.png", "flower_02.png","flower_03.png","flower_04.png","flower_05.png","flower_06.png"]
   
   
   
    
    //var count:Int = Int(interval.self)
    let timeSelector: Selector = #selector(ViewController.updateTime)   //object 에서는 #을 사용한다.(메서드나 함수 앞에)
    //object 에서는 #을 사용한다.(메서드나 함수 앞에)

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
        
        
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
        displayImage()
        
    }
    

   
    @objc func updateTime(){
        let date: NSDate = NSDate() // NS:Next Step, 스티브잡스
        let formatter = DateFormatter()
        
        formatter.locale = Locale(identifier: "ko")
        formatter.dateFormat = "yyyy-MM-dd EEE a hh:mm:ss" //EEE - 요일 , a - am/pm, 24시간 - HH:mm:ss
        lbltime.text = "현재시간 : \(formatter.string(from: date as Date))"
        
        
        timecount = timecount + 1
        
        
        if timecount % 3 == 0 {
            count += 1
            if count >= imageName.count{
                count = 0
            }
        displayImage()
        }
    }
    
    
   
    
    
    func displayImage(){
        
        lblImageName.text = imageName[count]
        imgView.image = UIImage(named:imageName[count])
    }
    
    
}

