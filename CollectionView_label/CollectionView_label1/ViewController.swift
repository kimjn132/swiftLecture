//
//  ViewController.swift
//  CollectionView_label1
//
//  Created by Anna Kim on 2022/12/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var dataArray: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        dataInit()
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    func dataInit(){
        dataArray.append("유비")
        dataArray.append("관우")
        dataArray.append("장비")
        dataArray.append("조조")
        dataArray.append("여포")
        dataArray.append("동탁")
        dataArray.append("초선")
        dataArray.append("손견")
        dataArray.append("장양")
        dataArray.append("손책")
    }
    
    
}// ViewController


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
        cell.lblHuman.text = dataArray[indexPath.row]
        cell.lblHuman.backgroundColor = .yellow
        return cell
    }
    
    //click event
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(dataArray[indexPath.row])
    }
}//viewController

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
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "sgDetail"{
            let cell = sender as! CollectionViewCell
            let indexPath = collectionView.indexPath(for: cell)
            //instance
            let detailView = segue.destination as! DetailViewController
            //데이터 넣어주기
            detailView.receiveditem = dataArray[indexPath!.row]
        }
    }
    
    
}


