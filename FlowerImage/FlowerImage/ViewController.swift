//
//  ViewController.swift
//  FlowerImage
//
//  Created by Anna Kim on 2022/12/04.
//

//첫번째 화면 어떻게?

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgTitle: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    
    @IBOutlet weak var btnPrev: UIButton!
    @IBOutlet weak var btnNext: UIButton!
    
    
    
    var imageName = ["flower_01.png", "flower_02.png","flower_03.png","flower_04.png","flower_05.png","flower_06.png"]
    
    
    var numImage = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        numImage = 0
        displayImage()
    }

    @IBAction func btnPrev(_ sender: UIButton) {
        numImage = numImage - 1

        //numImage <= 0이렇게 하면 0번째 부터 5번째 배열의 이미지가 나오므로 0번째 배열 이미지가 나올 기회가 없다.
        if (numImage<0) {
            //imageName.count는 6이고 배열에서는 0~5 이므로 -1해줘야 한다.
            numImage = imageName.count - 1
        } //

           displayImage()

        print(numImage)

        
        
    }
    
    
    @IBAction func btnNext(_ sender: UIButton) {
        
        numImage = numImage + 1
       
        
        if numImage >= imageName.count{
            numImage = 0
            
        }
        
        //else에 넣으면 0번 사진이 나오지 않는다. (숫자 0은 출력됨)
            displayImage()
       
        
        
        
        
        print(numImage)
    }

    // image 출력 (중복된
    
    
    
func displayImage(){
    imgTitle.text = imageName[numImage]
    imgView.image = UIImage(named: imageName[numImage])
    
}
    
    
    
    @IBAction func button(_ sender: UIButton){
        
        if sender == btnPrev{
            numImage -= 1
            if (numImage < 0) {
                numImage = imageName.count - 1
            }
        }else{
            numImage += 1
            if (numImage >= imageName.count) {
                numImage = 0
            }
        }
        displayImage()
    }
    
    
}//viewcontroller

