//
//  DeleteModel.swift
//  FirebaseList
//
//  Created by Anna Kim on 2022/12/31.
//

import Foundation
import Firebase

class DeleteModel{
    let db = Firestore.firestore()
    
    func deleteItems(documentId: String) -> Bool{
        var status: Bool = true
        
        db.collection("students")
            .document(documentId).delete(){error in
                if error != nil{
                    status = false
                }else{
                    status = true
                }
                
            }
        return status
    }
}

