//
//  DetailViewController.swift
//  DBCRUD(mySQL)
//
//  Created by Anna Kim on 2022/12/31.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var tfCode: UITextField!
    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfDept: UITextField!
    @IBOutlet weak var tfPhone: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        tfCode.text = Message.scode
        tfCode.isUserInteractionEnabled = false
        tfName.text = Message.sname
        tfDept.text = Message.sdept
        tfPhone.text = Message.sphone
    }
    
    
    

    @IBAction func btnUpdate(_ sender: UIButton) {
        let name = tfName.text
        let dept = tfDept.text
        let phone = tfPhone.text
        let code = tfCode.text
        
        
        
            let updateModel = UpdateModel()
            let result = updateModel.updateItems(name: name!, dept: dept!, phone: phone!, code: code!)
            
            if result == true{
                let resultAlert = UIAlertController(title: "완료", message: "수정 되었습니다.", preferredStyle: .alert)
                let onAction = UIAlertAction(title: "OK", style: .default, handler: {ACTION in self.navigationController?.popViewController(animated: true)})
                
                resultAlert.addAction(onAction)
                present(resultAlert, animated: true)
                
            }else{
                let resultAlert = UIAlertController(title: "실패", message: "에러가 발생 되었습니다.", preferredStyle: .alert)
                let onAction = UIAlertAction(title: "OK", style: .default)
                
                resultAlert.addAction(onAction)
                present(resultAlert, animated: true)

                
            }
        
        
    }
    
    
    @IBAction func btnDelete(_ sender: UIButton) {
        
        
        let code = tfCode.text
        
        
        
            let deleteModel = DeleteModel()
            let result = deleteModel.deleteItems(code: code!)
            
            if result == true{
                let resultAlert = UIAlertController(title: "완료", message: "삭제 되었습니다.", preferredStyle: .alert)
                let onAction = UIAlertAction(title: "OK", style: .default, handler: {ACTION in self.navigationController?.popViewController(animated: true)})
                
                resultAlert.addAction(onAction)
                present(resultAlert, animated: true)
                
            }else{
                let resultAlert = UIAlertController(title: "실패", message: "에러가 발생 되었습니다.", preferredStyle: .alert)
                let onAction = UIAlertAction(title: "OK", style: .default)
                
                resultAlert.addAction(onAction)
                present(resultAlert, animated: true)

                
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
