//
//  ViewController.swift
//  emojiPlusPlusNew
//
//  Created by Anna Kim on 2022/12/25.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var lblImogiPlus: UILabel!
    
    @IBOutlet weak var lblEmojiOne: UILabel!
    
    
    var arrImogi = ["π€£","βΊοΈ","π€£","βΊοΈ","π€ͺ","βΊοΈ","π€ͺ"]
    
    var indexState = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblImogiPlus.text = ""
        lblEmojiOne.text = arrImogi[0]
    }

    
    @IBAction func btnPlay(_ sender: UIButton) {
        
        indexState = indexState + 1
        
        if (indexState >= arrImogi.count){
            indexState = 0
        }else{
            //λ°°μ΄μμ νλμ©λ§ λ³΄μ¬μ€
            lblEmojiOne.text = arrImogi[indexState]
            //λ°°μ΄μμ λμ¨ κ² νλμ© λμ ν΄μ λ³΄μ¬μ€
            lblImogiPlus.text! += arrImogi[indexState]
        }
    
        print(indexState)
    }
    
    
    
    
    @IBAction func btnPrevious(_ sender: UIButton) {
        
        indexState = indexState - 1
        
        print(indexState)
        
        if (indexState <= 0){
            
            indexState = arrImogi.count
           

        }else{
            //λ°°μ΄μμ νλμ©λ§ λ³΄μ¬μ€
            lblEmojiOne.text = arrImogi[indexState]
            
            
            
            print("\(arrImogi[indexState])")
            //λ°°μ΄μμ λμ¨ κ² νλμ© λμ ν΄μ λΉΌμ€
            lblImogiPlus.text! = String(lblImogiPlus.text!.dropLast(1))
        }
        
        
    }
    
    

}

