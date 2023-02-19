//
//  ViewController.swift
//  PickerView
//
//  Created by Anna Kim on 2022/12/11.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var pickerImage: UIPickerView!
    @IBOutlet weak var lblImageFileName: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var imageFileName = ["w1.jpg","w2.jpg","w3.jpg","w4.jpg","w5.jpg","w6.jpg","w7.jpg","w8.jpg","w9.jpg","w10.jpg"]
//    var displayName = ["1","2","3","4","5","6","7","8","9","10"]
    var imageArray = [UIImage?]()
    
    //pickerview의 모습
    //var maxArrayNum = 0
    
    //보통 컬럼 두개로 하지 않고, pickerview를 따로 하나씩 만든다.
    let pickerViewColumn = 1
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // pickerView의 raw 개수 (count)
        //maxArrayNum = imageFileName.count
        
        //사진 배열에 넣어줌
        for i in 0..<imageFileName.count{
            let image = UIImage(named: imageFileName[i])
            imageArray.append(image)
        }
        
        lblImageFileName.text = "Selected Item : \(imageFileName[0])"
        imageView.image = imageArray[0]
        
        
        //extension에서의 메소드를 실행시킴
        pickerImage.dataSource = self
        pickerImage.delegate = self
    }//viewdidload


    
    
}//viewcontroller


    
    

