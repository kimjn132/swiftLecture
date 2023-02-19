//
//  DetailViewController.swift
//  TableAnimal1
//
//  Created by Anna Kim on 2022/12/31.
//

import UIKit

class DetailViewController: UIViewController {

    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lblDetail: UILabel!
    
    var receivedName = ""
    var receivedImageName = ""
    var receivedDetail = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        imgView.image = UIImage(named: receivedImageName)
        //if문
        if receivedDetail == "파충류"{
            lblDetail.text = "이 동물의 이름은 \(receivedName)이며 분류는 \(receivedDetail)이며 날 수 있습니다."
        }else{
            lblDetail.text = "이 동물의 이름은 \(receivedName)이며 분류는 \(receivedDetail)이며 날 수 없습니다."
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
