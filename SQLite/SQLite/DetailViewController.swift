//
//  DetailViewController.swift
//  SQLite
//
//  Created by Anna Kim on 2022/12/30.
//

import UIKit
import SQLite3

class DetailViewController: UIViewController {

    
    @IBOutlet weak var tfId: UITextField!
    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfDept: UITextField!
    @IBOutlet weak var tfPhone: UITextField!
    
    //prepared 안 쓰려면 message 사용(segue 사용할 때 message가 좋다. 보안상)
    var receivedId = 0
    var receivedName = ""
    var receivedDept = ""
    var receivedPhone = ""
    
    var db: OpaquePointer?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        tfId.text = String(receivedId)
        tfName.text = String(receivedName)
        tfDept.text = String(receivedDept)
        tfPhone.text = String(receivedPhone)
        
        let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("StudentsData.sqlite")
        sqlite3_open(fileURL.path(), &db)
    }
    
    
    @IBAction func btnUpdate(_ sender: UIButton) {
        var stmt: OpaquePointer?
        let SQLITE_TRANSIENT = unsafeBitCast(-1, to: sqlite3_destructor_type.self)
        
        let id: String = tfId.text!
        let name = tfName.text?.trimmingCharacters(in: .whitespaces)
        let dept = tfDept.text?.trimmingCharacters(in: .whitespaces)
        let phone = tfPhone.text?.trimmingCharacters(in: .whitespaces)
        //-1은 한글 때문이다. 한글은 2byte이기 때문에..
        let queryString = "UPDATE students SET sname=?, sdept=?, sphone=? where sid=?"
        
        sqlite3_prepare(db, queryString, -1, &stmt, nil)
        
        sqlite3_bind_text(stmt, 1, name, -1, SQLITE_TRANSIENT)
        sqlite3_bind_text(stmt, 2, dept, -1, SQLITE_TRANSIENT)
        sqlite3_bind_text(stmt, 3, phone, -1, SQLITE_TRANSIENT)
        sqlite3_bind_int(stmt, 4, Int32(id)!)
        
        sqlite3_step(stmt)
        
        let resultAlert = UIAlertController(title: "결과", message: "수정 되었습니다", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "네 알겠습니다.", style: .default, handler: {ACTION in self.navigationController?.popViewController(animated: true)})
        
        resultAlert.addAction(okAction)
        present(resultAlert, animated: true)
    }
    
    @IBAction func btnDelete(_ sender: UIButton) {
        var stmt: OpaquePointer?
        
        let id: String = tfId.text!
       
        //-1은 한글 때문이다. 한글은 2byte이기 때문에..
        let queryString = "DELETE FROM students WHERE sid = ?"
        
        sqlite3_prepare(db, queryString, -1, &stmt, nil)
        
        
        sqlite3_bind_int(stmt, 1, Int32(id)!)
        
        sqlite3_step(stmt)
        
        let resultAlert = UIAlertController(title: "결과", message: "삭제 되었습니다", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "네 알겠습니다.", style: .default, handler: {ACTION in self.navigationController?.popViewController(animated: true)})
        
        resultAlert.addAction(okAction)
        present(resultAlert, animated: true)
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
