//
//  AddViewController.swift
//  tabControlImage
//
//  Created by Anna Kim on 2022/12/31.
//

import UIKit

class AddViewController: UIViewController {

    
    @IBOutlet weak var tfInsert: UITextField!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var imgPicker: UIPickerView!
    
    var imageFileName = ["cart.png", "clock.png", "pencil.png"]
    var displayName = ["1","2","3"]
    var imageArray = [UIImage?]()
    
    //pickerview의 모습
    var maxArrayNum = 0
    //보통 컬럼 두개로 하지 않고, pickerview를 따로 하나씩 만든다.
    let pickerViewColumn = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // pickerView의 raw 개수 (count)
        maxArrayNum = imageFileName.count
        
        //사진 배열에 넣어줌
        for i in 0..<imageFileName.count{
            let image = UIImage(named: imageFileName[i])
            imageArray.append(image)
        }
        
        
        imgView.image = imageArray[0]
        
        
        //extension에서의 메소드를 실행시킴
        imgPicker.dataSource = self
        imgPicker.delegate = self
    }
    

    
    @IBAction func btnAddItem(_ sender: UIButton) {
        if tfInsert.text!.trimmingCharacters(in: .whitespaces).isEmpty{
            Message.check = "Old"
        }else{
            Message.check = "New"
            Message.items = tfInsert.text!
            Message.itemsImageFiles = imageFileName[Message.rowNum]
        }
        
        tfInsert.text = ""
        imgView.image = imageArray[Message.rowNum]
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
