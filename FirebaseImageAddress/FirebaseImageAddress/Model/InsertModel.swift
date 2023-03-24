//
//  InsertModel.swift
//  FirebaseImageAddress
//
//  Created by Kenny on 2023/02/15.
//

import Foundation
import Firebase

class InsertModel{
    
    let db = Firestore.firestore()
    
    func insertItems(name: String, phone: String, address: String, relation: String, image: String) -> Bool{
        
        var status: Bool = true
        
        db.collection("addressLists").addDocument(data: [
            "name" : name,
            "phone" : phone,
            "address" : address,
            "relation" : relation,
            "image" : image
        ]){error in
            if error != nil{
                status = false
            }else{
                status = true
            }
        }
        
        return status
    }

}
