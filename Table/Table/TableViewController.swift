//
//  TableViewController.swift
//  Table
//
//  Created by Anna Kim on 2022/12/23.
//

import UIKit

class TableViewController: UITableViewController {

    //cell이 아니라 table 자체를 연결시켜야 한다.
    @IBOutlet var tvListView: UITableView!
    
    var dataArray: [TodoList] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //data 넣어주는 곳
        dataInit();
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        
        //편집 버튼(left)
         self.navigationItem.leftBarButtonItem = self.editButtonItem
    }

    
    func dataInit(){
        dataArray.append(TodoList(items: "책 구매", itemsImageFile: "cart.png"))
        dataArray.append(TodoList(items: "철수와 약속", itemsImageFile: "clock.png"))
        dataArray.append(TodoList(items: "스터디 준비하기", itemsImageFile: "pencil.png"))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        appendData()
        tvListView.reloadData() //insert한 데이터 까지 새로 화면 reload 해준다. 
    }
    
    
    func appendData(){
        if Message.check == "New"{
            dataArray.append(TodoList(items: Message.items, itemsImageFile: Message.itemsImageFile))
            Message.check = "Old"
        }
    }
    
    // MARK: - Table view data source

    //테이블의 섹션(컬럼) 개수
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    //섹션당 열의 개수
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dataArray.count
    }

    // 셀의 구성
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)

        // Configure the cell...
        var content = cell.defaultContentConfiguration()
        content.text = dataArray[indexPath.row].items
        content.image = UIImage(named: dataArray[indexPath.row].itemsImageFile)
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

    // Table 셀 삭제 
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            dataArray.remove(at: indexPath.row) //실제 데이터 지우기
            tableView.deleteRows(at: [indexPath], with: .fade)  //화면에서 지우기
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
   
    //delete 언어 한국어로 바꾸기
    override func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "삭제"
    }

    // 셀 목록 순서 변경하기
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let itemToMove = dataArray[fromIndexPath.row]
        dataArray.remove(at: fromIndexPath.row) //기존 위치에서 지우고
        dataArray.insert(itemToMove, at: to.row)    //새로운 위치에 다시 넣어준다.
    }
    

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation(이동 관련)

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "sgDetail"{
            let cell = sender as! UITableViewCell
            let indexPath = tvListView.indexPath(for: cell)
            //instance
            let detailView = segue.destination as! DetailViewController
            //데이터 넣어주기
            detailView.receiveItem = dataArray[indexPath!.row].items
        }
    }
    

}
