//
//  ViewController.swift
//  FlowerImageAtTheSameTime
//
//  Created by Anna Kim on 2022/12/04.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var imgBig: UIImageView!
    @IBOutlet weak var imgSmall: UIImageView!
    
    
    var imageArr = ["flower_01.png", "flower_02.png","flower_03.png","flower_04.png","flower_05.png","flower_06.png"]
    
    var numImg = 0
    var numImg1 = 1
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        displayImage()
        
        numImg = 0
        numImg1 = 1
    }

    @IBAction func btnPre(_ sender: UIButton) {
        numImg = numImg - 1
        numImg1 = numImg1 - 1
        
        if numImg < 0{
            
            //numImg = imageArr.count 이렇게만 하면 안됨..
            numImg = imageArr.count-1
        }
        if numImg1 < 0{
            numImg1 = imageArr.count-1
        }
        
        displayImage()
        
        print(numImg)
        print(numImg1)
        
    }
    
    
    
    @IBAction func btnNext(_ sender: UIButton) {
        
        numImg = numImg + 1
        numImg1 = numImg1 + 1
        
        if numImg >= imageArr.count{
            numImg = 0
        }
        
        
        if numImg1 >= imageArr.count{
            numImg1 = 0
        }
        
        displayImage()
        
        
    }
    
    
    func displayImage(){
        lblName.text = imageArr[numImg]
        imgBig.image = UIImage(named: imageArr[numImg])
        imgSmall.image = UIImage(named: imageArr[numImg1])
    }

}

