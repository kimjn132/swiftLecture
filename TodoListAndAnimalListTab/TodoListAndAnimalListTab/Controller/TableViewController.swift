//
//  TableViewController.swift
//  TableAnimal1
//
//  Created by Anna Kim on 2022/12/31.
//

import UIKit

class AnimalTableViewController: UITableViewController {

    
    @IBOutlet var tvListView: UITableView!
    
    var dataArray: [AnimalList] = []
    
    var animalName = ["벌", "고양이", "젖소", "강아지", "여우", "원숭이", "돼지", "늑대"]
    var imageFileName = ["bee.png", "cat.png", "cow.png", "dog.png", "fox.png", "monkey.png", "pig.png", "wolf.png"]
    var animalDetail = ["파충류", "포유류", "포유류", "포유류", "포유류", "포유류", "포유류", "포유류"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataInit();
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    
    
    func dataInit(){
        
        for i in 0..<animalName.count{
            dataArray.append(AnimalList(names: animalName[i], animalImageName: imageFileName[i], animalDetail: animalDetail[i]))
        }
    }
      
    
    override func viewWillAppear(_ animated: Bool) {
        appendData()
        tvListView.reloadData() //insert한 데이터 까지 새로 화면 reload 해준다.
    }
    
    func appendData(){
        if Message.check == "New"{
            dataArray.append(AnimalList(names: Message.names, animalImageName: Message.animalImageName, animalDetail: Message.animalDetail))
            Message.check = "Old"
        }
    }

    // MARK: - Table view data source
    

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dataArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)

        // Configure the cell...
        var content = cell.defaultContentConfiguration()
        content.text = dataArray[indexPath.row].names
        content.image = UIImage(named: dataArray[indexPath.row].animalImageName)
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
        if segue.identifier == "AsgDetail"{
            let cell = sender as! UITableViewCell
            let indexPath = tvListView.indexPath(for: cell)
            //instance
            let detailView = segue.destination as! DetailViewController
            //데이터 넣어주기
            detailView.receivedName = dataArray[indexPath!.row].names
            detailView.receivedImageName = dataArray[indexPath!.row].animalImageName
            detailView.receivedDetail = dataArray[indexPath!.row].animalDetail
        }
    }
    

}
