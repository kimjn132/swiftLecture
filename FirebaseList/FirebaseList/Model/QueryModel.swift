//
//  QueryModel.swift
//  FirebaseList
//
//  Created by Anna Kim on 2022/12/31.
//

import Foundation

import Firebase // <<<<<<<<<<

protocol QueryModelProtocol{
    func itemDownloaded(items: [DBModel])
}

class QueryModel{
    var delegate: QueryModelProtocol!
    let db = Firestore.firestore()
    
    func downloadItems(){
        var locations: [DBModel] = []
        
        db.collection("students")
            .order(by: "code")
            .getDocuments(completion: {(querySnapshot, err) in
                if let err = err{
                    print("Error getting documents : \(err)")
                }else{
                    print("Data is downloaded.")
                    //data를 하나씩 가져옴
                    for document in querySnapshot!.documents{
                        guard let data = document.data()["code"] else{return}
                        print("\(document.documentID) => \(data)")
                        let query = DBModel(documentId: document.documentID,
                                            code: document.data()["code"] as! String,
                                            name: document.data()["name"] as! String,
                                            dept: document.data()["dept"] as! String,
                                            phone: document.data()["phone"] as! String)
                        print(query)
                        locations.append(query)
                    }
                    
                    DispatchQueue.main.async {
                        // for문 돌려 다운로드 받은 게 list로 들어감
                        self.delegate.itemDownloaded(items: locations)
                    }
                }
            })
    }
}
