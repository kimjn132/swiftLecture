//
//  ViewController.swift
//  CollectionView_Flower
//
//  Created by Anna Kim on 2023/01/03.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var dataArray: [String] = []
    
   // var imageName = ["flower_01.png", "flower_02.png", "flower_03.png", "flower_04.png", "flower_05.png", "flower_06.png", ]
    
    override func viewDidLoad() {
            super.viewDidLoad()

            // Do any additional setup after loading the view.
            dataInit()
            collectionView.delegate = self
            collectionView.dataSource = self
    }
    
    func dataInit(){
        dataArray.append("flower_01.png")
        dataArray.append("flower_02.png")
        dataArray.append("flower_03.png")
        dataArray.append("flower_04.png")
        dataArray.append("flower_05.png")
        dataArray.append("flower_06.png")
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "sgDetail"{
            
            let cell = sender as! CollectionViewCell
            //클릭한 해당 cell 번호 받기
            let indexPath = collectionView.indexPath(for: cell)
            
            //instance
            let detailView = segue.destination as! DetailViewController
            
            //데이터 넣어주기
            detailView.receivedItem = dataArray[indexPath!.row]
        }
    }
    
}//viewcontroller


//viewcontroller에 대한 extension
extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    
    //cell 개수
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArray.count
    }
    
//    //Cell 개수
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return dataArray.count
//    }
//
    //Cell 구성
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as! CollectionViewCell
        
        cell.backgroundColor = .lightGray
        cell.imgView.image = UIImage(named: dataArray[indexPath.row])
        
        return cell
    }
    
    //click event
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(dataArray[indexPath.row])
    }
    
}//ViewController(extension)



//cell에 대한 (extension) Layout
extension ViewController: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width / 3 - 1      //가로 3등분 간격을 1씩 빼준다.
        let size = CGSize(width: width, height: width)
        return size
    }
    
    //위 아래 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    //좌우 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    
    
}//Viewcontroller(extension)



