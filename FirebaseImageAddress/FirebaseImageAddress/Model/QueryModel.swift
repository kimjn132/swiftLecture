//
//  QueryModel.swift
//  FirebaseImageAddress
//
//  Created by Kenny on 2023/02/15.
//

import Foundation
import Firebase // <<<<<

protocol QueryModelProtocol{
    func itemDownloaded(items: [DBModel])
}

class QueryModel{
    
    var delegate: QueryModelProtocol!
    let db = Firestore.firestore()
    
    func downloadItems(){
        var locations: [DBModel] = []
        
        db.collection("addressLists")
            .order(by: "name").getDocuments(completion: {(querySnapshot, err) in
                if let err = err{
                    print("Error getting documents : \(err)")
                }else{
                    print("Data is downloaded.")
                    for document in querySnapshot!.documents{
                        guard let data = document.data()["name"] else { return }
                        print("\(document.documentID) => \(data)")
                        let query = DBModel(documentId: document.documentID,
                                            name: document.data()["name"] as! String,
                                            phone: document.data()["phone"] as! String,
                                            address: document.data()["address"] as! String,
                                            relation: document.data()["relation"] as! String,
                                            image: document.data()["image"] as! String)
                        print(query)
                        locations.append(query)
                    }
                    DispatchQueue.main.async {
                        self.delegate.itemDownloaded(items: locations)
                    }
                    
//
//                    DispatchQueue.main.async(execute: {() -> Void in
//                        self.delegate.itemDownloaded(items: locations)
//                    })
                }
            })
        
    }// downloadItems
        
    
} // QueryModel

