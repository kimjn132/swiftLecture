//
//  DetailViewController.swift
//  Table
//
//  Created by Anna Kim on 2022/12/23.
//

import UIKit

class TableDetailViewController: UIViewController {

    @IBOutlet weak var lblItem: UILabel!
    
    var receiveItem = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        lblItem.text = receiveItem
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
