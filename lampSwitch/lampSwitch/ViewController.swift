//
//  ViewController.swift
//  lampSwitch
//
//  Created by Anna Kim on 2022/12/09.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var swResize: UISwitch!
    
    
    var imgOn = UIImage(named: "lampOn.png")
    var imgOff = UIImage(named: "lampOff.png")
    
    @IBOutlet weak var lblResize: UILabel!
    
    
    @IBOutlet weak var lblOnOff: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imgView.image = imgOn
    }

    @IBAction func swResizeImage(_ sender: UISwitch) {
        let scale: CGFloat = 1.5
        var newWidth: CGFloat?
        var newHeight: CGFloat?
        
        switch sender.isOn{
        case true:
            newWidth = imgView.frame.width * scale
            newHeight = imgView.frame.height * scale
            lblResize.text = "전구 축소"
        default:
            newWidth = imgView.frame.width / scale
            newHeight = imgView.frame.height / scale
            lblResize.text = "전구 확대"
       
        }
        
        imgView.frame.size = CGSize(width: newWidth!, height: newHeight!)
    }
    
    
    
    
    @IBAction func swImageOnOff(_ sender: UISwitch) {
        switch sender.isOn{
        case true:
            imgView.image = imgOn
            lblOnOff.text = "전구 Off"
        default:
            imgView.image = imgOff
            lblOnOff.text = "전구 On"
        }
    }
    
    

}

