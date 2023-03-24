//
//  DeleteModel.swift
//  FirebaseImageAddress
//
//  Created by Kenny on 2023/02/15.
//

import Foundation
import Firebase

class DeleteModel{
    let db = Firestore.firestore()
    
    func deleteItems(documentId: String) -> Bool{
        
        var status: Bool = true
        
        db.collection("addressLists").document(documentId).delete(){
            error in
                if error != nil{
                    status = false
                }else{
                    status = true
                }
        }
        
        return status

    }

}
