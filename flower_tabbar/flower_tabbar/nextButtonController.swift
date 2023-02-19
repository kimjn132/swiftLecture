//
//  ViewController.swift
//  FlowerImage
//
//  Created by Anna Kim on 2022/12/04.
//

//첫번째 화면 어떻게?

import UIKit

class nextButtonController: UIViewController {

    @IBOutlet weak var imgTitle: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    
    var imageName = ["flower_01.png", "flower_02.png","flower_03.png","flower_04.png","flower_05.png","flower_06.png"]
    
    
    var numImage = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        displayImage()
    }

    @IBAction func btnPrev(_ sender: UIButton) {
        numImage = numImage - 1
        
        if (numImage<0) {
            numImage = imageName.count-1
        } //
        
            imgTitle.text = imageName[numImage]
            imgView.image = UIImage(named: imageName[numImage])
        
        
    }
    
    
    @IBAction func btnNext(_ sender: UIButton) {
        
        numImage += 1
        
        if numImage >= imageName.count{
            numImage = 0
        }else{
            displayImage()
        }
    }
    
    // image 출력 (중복된
    func displayImage(){
        imgTitle.text = imageName[numImage]
        imgView.image = UIImage(named: imageName[numImage])
    }
    
    
    
    
}//viewcontroller

