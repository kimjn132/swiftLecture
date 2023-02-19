//
//  EditViewController.swift
//  lampNavigator
//
//  Created by Anna Kim on 2022/12/21.
//

import UIKit

class EditViewController: UIViewController {

    
   
    
    @IBOutlet weak var swOnOff: UISwitch!
    @IBOutlet weak var swRed: UISwitch!
    
    @IBOutlet weak var lblOnOff: UILabel!
    @IBOutlet weak var lblRed: UILabel!
    
    var isOn: Bool = Message.isOn
    var isRed: Bool = Message.red
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        swOnOff.isOn = isOn
        swRed.isOn = isRed
        
    }
    
    
    @IBAction func btnDone(_ sender: UIButton) {
        Message.isOn = isOn
        Message.red = isRed
        
        navigationController?.popViewController(animated: true)
    }
    
    
    
    
    @IBAction func swImageOnOff(_ sender: UISwitch) {
        if sender.isOn{
            isOn = true
        }else{
            isOn = false
        }
    }
    
    
    
    
    
    @IBAction func swImageRed(_ sender: UISwitch) {
        if sender.isOn{
            isRed = true
        }else{
            isRed = false
        }
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
