//
//  TableViewController.swift
//  DBCRUD(mySQL)
//
//  Created by Anna Kim on 2022/12/31.
//

import UIKit

class TableViewController: UITableViewController {

    @IBOutlet var listTableView: UITableView!
    
    var feedItem: [DBModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    
        //입력하고 다시 pop해서 돌아올 때 viewDidLoad는 실행 안되고 viewWillAppear은 항상 실행되므로  reloadAction은 viewWillAppear에 해줘야 한다.
    override func viewWillAppear(_ animated: Bool) {
        reloadAction()
    }
    
    func reloadAction(){
        let queryModel = QueryModel()
        queryModel.delegate = self
        queryModel.downloadItems()
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return feedItem.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)

        // Configure the cell...
        var content = cell.defaultContentConfiguration()
        content.text = "성명 : \(feedItem[indexPath.row].sname)"
        content.secondaryText = "학번 : \(feedItem[indexPath.row].scode)"
        cell.contentConfiguration = content
        
        
        return cell
    }// tableView
    

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
            let code = feedItem[indexPath.row].scode
            let deleteModel = DeleteModel()
            _ = deleteModel.deleteItems(code: code)
            
            //delete 하고 reload 해야 삭제한 데이터가 지워지고 reload 된다. (시간..)
            Timer.scheduledTimer(withTimeInterval: 0.3, repeats: false){(timer) in self.reloadAction()
            }
            
           
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
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
        if segue.identifier == "sgDetail" {
            let cell = sender as! UITableViewCell
            let indexPath = self.listTableView.indexPath(for: cell)
            
            Message.scode = feedItem[indexPath!.row].scode
            Message.sname = feedItem[indexPath!.row].sname
            Message.sdept = feedItem[indexPath!.row].sdept
            Message.sphone = feedItem[indexPath!.row].sphone

        }
    }
    

}

//여기서 실행하여 데이터 받아서 화면 구성
extension TableViewController: QueryModelProtocol{
    func itemDownloaded(items: [DBModel]) {
        feedItem = items
        self.listTableView.reloadData() //list 불러오고 화면 재구성
        
        
        
    }
}
