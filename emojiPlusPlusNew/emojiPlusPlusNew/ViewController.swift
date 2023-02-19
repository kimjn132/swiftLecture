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
    
    
    var arrImogi = ["🤣","☺️","🤣","☺️","🤪","☺️","🤪"]
    
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
            //배열에서 하나씩만 보여줌
            lblEmojiOne.text = arrImogi[indexState]
            //배열에서 나온 것 하나씩 누적해서 보여줌
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
            //배열에서 하나씩만 보여줌
            lblEmojiOne.text = arrImogi[indexState]
            
            
            
            print("\(arrImogi[indexState])")
            //배열에서 나온 것 하나씩 누적해서 빼줌
            lblImogiPlus.text! = String(lblImogiPlus.text!.dropLast(1))
        }
        
        
    }
    
    

}

