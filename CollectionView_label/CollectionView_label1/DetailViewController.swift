//
//  DetailViewController.swift
//  CollectionView_label1
//
//  Created by Anna Kim on 2022/12/24.
//

import UIKit

class DetailViewController: UIViewController {

    
    
    @IBOutlet weak var lblName: UILabel!
    
    var receiveditem = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblName.text = receiveditem
        // Do any additional setup after loading the view.
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
