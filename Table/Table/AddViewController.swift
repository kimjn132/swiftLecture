//
//  AddViewController.swift
//  Table
//
//  Created by Anna Kim on 2022/12/23.
//

import UIKit

class AddViewController: UIViewController {

    
    @IBOutlet weak var tfAddItem: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func btnAddItem(_ sender: UIButton) {
        if tfAddItem.text!.trimmingCharacters(in: .whitespaces).isEmpty{
            Message.check = "Old"
        }else{
            Message.check = "New"
            Message.items = tfAddItem.text!
            Message.itemsImageFile = "clock.png"
        }
        
        tfAddItem.text = ""
        navigationController?.popViewController(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
