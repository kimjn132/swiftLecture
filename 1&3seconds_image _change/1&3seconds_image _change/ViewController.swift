//
//  ViewController.swift
//  1&3seconds_image _change
//
//  Created by Anna Kim on 2022/12/13.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var lblImage1: UILabel!
    @IBOutlet weak var lblImage2: UILabel!
    
    
    @IBOutlet weak var Image1: UIImageView!
    @IBOutlet weak var Image2: UIImageView!
    
    //image counts
    var count1 = 0
    var count2 = 0
    
    
    var interval = 1.0 // 1second
    
    //1seconds & 3seconds count
    var timecount = 0
    
    
    var imageName = ["flower_01.png", "flower_02.png","flower_03.png","flower_04.png","flower_05.png","flower_06.png"]
   
   
    
    let timeSelector: Selector = #selector(ViewController.updateTime)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
        displayImage()
 
        
    }

    @objc func updateTime(){

        
        
        timecount = timecount + 1
        
        if timecount % 1 == 0 {
            count1 += 1
            if count1 >= imageName.count{
                count1 = 0
            }
        displayImage()
        }
        
        
        if timecount % 3 == 0 {
            count2 += 1
            if count2 >= imageName.count{
                count2 = 0
            }else{
                displayImage()
            }
        }
    }
    
    
    
    func displayImage(){
        
        lblImage1.text = imageName[count1]
        Image1.image = UIImage(named:imageName[count1])
        
        lblImage2.text = imageName[count2]
        Image2.image = UIImage(named:imageName[count2])

    }
    


}//viewcontroller

