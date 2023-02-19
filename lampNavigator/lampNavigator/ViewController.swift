//
//  ViewController.swift
//  lampNavigator
//
//  Created by Anna Kim on 2022/12/21.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var imgView: UIImageView!
    
    let imgOn = UIImage(named: "lampOn.png")
    let imgOff = UIImage(named: "lampOff.png")
    let imgRed = UIImage(named: "lampRed.png")
    
    var isOn = true
    var red = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imgView.image = imgOn
    }

//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let editViewController = segue.destination as! EditViewController
//
//    }
    
    override func viewWillAppear(_ animated: Bool) {
        if Message.isOn && Message.red{
            imgView.image = imgRed
            
        }else if Message.isOn{
            imgView.image = imgOn
        }else{
            imgView.image = imgOff
            
            
        }
        
       
    }
    
    
}

