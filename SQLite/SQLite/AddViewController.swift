//
//  AddViewController.swift
//  SQLite
//
//  Created by Anna Kim on 2022/12/30.
//

import UIKit
import SQLite3

class AddViewController: UIViewController {

    
    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfDept: UITextField!
    @IBOutlet weak var tfPhone: UITextField!
    
    
    var db: OpaquePointer?

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("StudentsData.sqlite")
        sqlite3_open(fileURL.path(), &db)
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func btnInsert(_ sender: UIButton) {
        
        var stmt: OpaquePointer?
        let SQLITE_TRANSIENT = unsafeBitCast(-1, to: sqlite3_destructor_type.self)
        
        let name = tfName.text?.trimmingCharacters(in: .whitespaces)
        let dept = tfDept.text?.trimmingCharacters(in: .whitespaces)
        let phone = tfPhone.text?.trimmingCharacters(in: .whitespaces)
        //-1은 한글 때문이다. 한글은 2byte이기 때문에..
        let queryString = "INSERT INTO students (sname, sdept, sphone) VALUES (?,?,?)"
        
        sqlite3_prepare(db, queryString, -1, &stmt, nil)
        
        sqlite3_bind_text(stmt, 1, name, -1, SQLITE_TRANSIENT)
        sqlite3_bind_text(stmt, 2, dept, -1, SQLITE_TRANSIENT)
        sqlite3_bind_text(stmt, 3, phone, -1, SQLITE_TRANSIENT)
        
        sqlite3_step(stmt)
        
        let resultAlert = UIAlertController(title: "결과", message: "입력 되었습니다", preferredStyle: .alert)
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
