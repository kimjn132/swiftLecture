//
//  DetailViewController.swift
//  tabControlImage
//
//  Created by Anna Kim on 2022/12/31.
//

import UIKit

class ImageDetailViewController: UIViewController {

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    
    var receivedItem = ""
    var receivedImage = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        lblName.text = receivedItem
        imgView.image = UIImage(named: receivedImage)
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
