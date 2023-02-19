//
//  TableViewController.swift
//  FirebaseList
//
//  Created by Anna Kim on 2022/12/31.
//

import UIKit

class TableViewController: UITableViewController {

    @IBOutlet var listTableView: UITableView!
    
    var studentStore: [DBModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    
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
        return studentStore.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)

        // Configure the cell...

        var content = cell.defaultContentConfiguration()
        content.text = "성명 : \(studentStore[indexPath.row].name)"
        content.secondaryText = "학번 : \(studentStore[indexPath.row].code)"
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
            let documentId = studentStore[indexPath.row].documentId
            let deleteModel = DeleteModel()
            _ = deleteModel.deleteItems(documentId: documentId)
            self.reloadAction()
            //timer 필요 없다. streaming 방식이라서
            
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
            Message.documentId = studentStore[indexPath!.row].documentId
            Message.scode = studentStore[indexPath!.row].code
            Message.sname = studentStore[indexPath!.row].name
            Message.sdept = studentStore[indexPath!.row].dept
            Message.sphone = studentStore[indexPath!.row].phone

        }
    }
    

}// TableViewController

extension TableViewController: QueryModelProtocol{
    func itemDownloaded(items: [DBModel]) {
        studentStore = items
        self.listTableView.reloadData()
    }
}
