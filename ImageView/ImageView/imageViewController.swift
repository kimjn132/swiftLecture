//
//  ViewController.swift
//  ImageView
//
//  Created by Anna Kim on 2022/12/09.
//

import UIKit

class imageViewController: UIViewController {

    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var btnResize: UIButton!
    
    var imgOn = UIImage(named: "lamp_on.png")
    var imgOff = UIImage(named: "lamp_off.png")
    
    //상태변수
    var isZoom = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imgView.image = imgOn
        
    }

    @IBAction func btnResizeImage(_ sender: UIButton) {
        // 이미지 크기를 2배로, GPU 돌리기
        let scale: CGFloat = 2.0
        var newWidth: CGFloat?
        var newHeight: CGFloat?
        
        if isZoom{//true
            newWidth = imgView.frame.width / scale
            newHeight = imgView.frame.height / scale
            btnResize.setTitle("Image확대", for: .normal)
        
        }else{//false
            newWidth = imgView.frame.width * scale
            newHeight = imgView.frame.height * scale
            btnResize.setTitle("Image축소", for: .normal)
        }
        imgView.frame.size = CGSize(width: newWidth!, height: newHeight!)
        isZoom = !isZoom
        
    }
    
    //Graphic Process U: 그래픽이 전부 함수식, 계산 전용 CPU, 그림 전용
    
    
    @IBAction func switchImageOnOFf(_ sender: UISwitch) {
//        if sender.isOn{//true
//            imgView.image = imgOn
//        }else{
//            imgView.image = imgOff
//        }
        
        //switch문이 if문보다 빠르다.
        switch sender.isOn{
        case true:
            imgView.image = imgOn
        default:
            imgView.image = imgOff
        }
        
    }
    

}//viewcontroller

