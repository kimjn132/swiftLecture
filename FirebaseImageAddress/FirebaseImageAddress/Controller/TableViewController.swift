//
//  TableViewController.swift
//  FirebaseImageAddress
//
//  Created by Kenny on 2023/02/15.
//

import UIKit
import FirebaseStorage // <<<<

class TableViewController: UITableViewController {

    @IBOutlet var listTableView: UITableView!
    
    var addressStore: [DBModel] = []
    
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
        print("*******")
    }

    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return addressStore.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! TableViewCell

        // Configure the cell...
        cell.lblName.text = addressStore[indexPath.row].name
        cell.lblPhone.text = addressStore[indexPath.row].phone
        
        let storage = Storage.storage()
        let httpsReference = storage.reference(forURL: addressStore[indexPath.row].image)
                                               
        httpsReference.getData(maxSize: 1 * 1024 * 1024) { data, error in
          if let error = error {
              print("Error : \(error)")
          } else {
              cell.imgView.image = UIImage(data: data!)
          }
        }
        
        return cell
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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
            let indexPath = self.listTableView.indexPath(for: cell)
            let detailView = segue.destination as! DetailViewController
            
            detailView.documentId = addressStore[indexPath!.row].documentId
            detailView.name = addressStore[indexPath!.row].name
            detailView.phone = addressStore[indexPath!.row].phone
            detailView.address = addressStore[indexPath!.row].address
            detailView.relation = addressStore[indexPath!.row].relation
            detailView.image = addressStore[indexPath!.row].image
        }
        
    }
    

} // TableViewController

extension TableViewController: QueryModelProtocol{
    func itemDownloaded(items: [DBModel]) {
        addressStore = items
        self.listTableView.reloadData()
    }
}

