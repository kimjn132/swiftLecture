//
//  UpdateModel.swift
//  FirebaseList
//
//  Created by Anna Kim on 2022/12/31.
//

import Foundation
import Firebase

class UpdateModel{
    let db = Firestore.firestore()
    
    func updateItems(documentId: String, code: String, name: String, dept: String, phone: String) -> Bool{
        var status: Bool = true
        
        db.collection("students")
            .document(documentId).updateData([
                "code" : code,
                "name" : name,
                "dept" : dept,
                "phone" : phone
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
