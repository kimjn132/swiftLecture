//
//  TableViewController.swift
//  SQLite
//
//  Created by Anna Kim on 2022/12/30.
//

import UIKit
//SQLite는 ios에 기본으로 들어가 있다.
import SQLite3      //  <<<<<<<<<<<<<<


class TableViewController: UITableViewController {

    
    @IBOutlet var tvListView: UITableView!
    
    var db: OpaquePointer?
    var studentList: [Students] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // SQLite 설정하기
        let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("StudentsData.sqlite")
        
        // 설정한 것 실행(파일 연결)
        if sqlite3_open(fileURL.path(), &db) != SQLITE_OK{
            //if error 걸리면
            print("Error opening database")
        }
        
        //shared preferences를 주로 사용, 고객들 개인 정보를 서버에 안두고 분산하기
        
        // Table 만들기
        if sqlite3_exec(db, "CREATE TABLE IF NOT EXISTS students (sid INTEGER PRIMARY KEY AUTOINCREMENT, sname TEXT, sdept TEXT, sphone TEXT)", nil, nil, nil) != SQLITE_OK{
            let errMsg = String(cString: sqlite3_errmsg(db)!)
            print("Error create table : \(errMsg)")
            return  //에러 나면은 실행 안한다.
        }
        
        // Temporary Insert Action(insert된 것 확인)
        //tempInsert()
        
        // Table 내용 불러오기
            //readValues()
        
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }//viewDidLoad
    
    
    //리스트 보여주는 페이지가 뒤에 있다가 다시 나타날 때 새로 입력한 데이터가 같이 보여진다
    override func viewWillAppear(_ animated: Bool) {
        readValues()
    }
    
    
    
//    func tempInsert(){
//        var stmt: OpaquePointer?
//        let SQLITE_TRANSIENT = unsafeBitCast(-1, to: sqlite3_destructor_type.self)
//        //-1은 한글 때문이다. 한글은 2byte이기 때문에..
//        let queryString = "INSERT INTO students (sname, sdept, sphone) VALUES (?,?,?)"
//
//        if sqlite3_prepare(db, queryString, -1, &stmt, nil) != SQLITE_OK{
//            let errMsg = String(cString: sqlite3_errmsg(db)!)
//            print("Error preparing insert : \(errMsg)")
//            return  //에러 나면은 실행 안한다.
//        }
//
//        sqlite3_bind_text(stmt, 1, "유비", -1, SQLITE_TRANSIENT)  //영어는 "유비"까지 적으면 된다.
//        sqlite3_bind_text(stmt, 2, "컴퓨터공학과", -1, SQLITE_TRANSIENT)
//        sqlite3_bind_text(stmt, 3, "1234", -1, SQLITE_TRANSIENT)
//
//        if sqlite3_step(stmt) != SQLITE_OK{
//            let errMsg = String(cString: sqlite3_errmsg(db)!)
//            print("Error insert data : \(errMsg)")
//            return  //에러 나면은 실행 안한다.
//        }
//
//
//    }//tempInsert
    
    
    
    func readValues(){
        studentList.removeAll()
        
        var stmt: OpaquePointer?
        let queryString = "SELECT * FROM students"
        
        if sqlite3_prepare(db, queryString, -1, &stmt, nil) != SQLITE_OK{
            let errMsg = String(cString: sqlite3_errmsg(db)!)
            print("Error preparing select : \(errMsg)")
            return  //에러 나면은 실행 안한다.
        }
        
        //data 하나씩 불러오기
        while(sqlite3_step(stmt) == SQLITE_ROW){
            let id = sqlite3_column_int(stmt, 0)    //id 값 가져오기
            let name = String(cString: sqlite3_column_text(stmt, 1))
            let dept = String(cString: sqlite3_column_text(stmt, 2))
            let phone = String(cString: sqlite3_column_text(stmt, 3))
           
            
            //while문 돌면서 studentList에 담는다
            studentList.append(Students(id: Int(id), name: name, dept: dept, phone: phone))
            
        }
        
        self.tvListView.reloadData()        // 하단에 numberOfSection , tableView 모두 실행된다.

    }
    
    
    
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return studentList.count
    }

    //셀 정의
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)

        // Configure the cell...
        var content = cell.defaultContentConfiguration()
        content.text = "학번 : \(studentList[indexPath.row].id)"
        content.secondaryText = "성명 : \(studentList[indexPath.row].name)"
        cell.contentConfiguration = content

        return cell
        
        
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            let id = studentList[indexPath.row].id
            deleteAction(id)
            readValues()    //삭제한 후 화면 다시 불러오기
            
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
    func deleteAction(_ id: Int){
        
        var stmt: OpaquePointer?
       
        //-1은 한글 때문이다. 한글은 2byte이기 때문에..
        let queryString = "DELETE FROM students WHERE sid = ?"
        
        sqlite3_prepare(db, queryString, -1, &stmt, nil)
        
        
        sqlite3_bind_int(stmt, 1, Int32(id))
        
        sqlite3_step(stmt)
    }
    
    
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "sgDetail"{
            let cell = sender as! UITableViewCell
            let indexPath = self.tvListView.indexPath(for: cell)
            let detailView = segue.destination as! DetailViewController
            
            
            detailView.receivedId = studentList[indexPath!.row].id
            detailView.receivedName = studentList[indexPath!.row].name
            detailView.receivedDept = studentList[indexPath!.row].dept
            detailView.receivedPhone = studentList[indexPath!.row].phone
            //>>detailviewcontrolller 에 property에 데이터 넣어줌 
            
        }
    }
    

}
