//
//  ViewController.swift
//  SnackBar
//
//  Created by Anna Kim on 2022/12/31.
//

import UIKit
import SnackBar_swift


class ViewController: UIViewController {

    
    
    @IBOutlet weak var lblStatus: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    
    @IBAction func btnSnackBar(_ sender: UIButton) {
        AppSnackBar.make(in: self.view,
                         message: "Long Time Snack Bar",
                         duration: .lengthLong)
        .setAction(with: "OK",
                   action:{
            self.lblStatus.text = "Long Time Snack Bar"
        }
        ).show()
        
        
        
    }
    
}

class AppSnackBar: SnackBar {
    
    override var style: SnackBarStyle {
        var style = SnackBarStyle()
        style.background = .red
        style.textColor = .green
        style.actionTextColor = .black
        return style
    }
}

 

