//
//  DeleteModel.swift
//  DBCRUD(mySQL)
//
//  Created by Anna Kim on 2022/12/31.
//

import Foundation

class DeleteModel{
    
    var urlPath = "http://localhost:8080/ios/studentDelete_ios.jsp"
    // https 안된다.
    
    func deleteItems(code: String) -> Bool{
        var result: Bool = true
        let urlDelete = "?code=\(code)"
        urlPath = urlPath + urlDelete
        
        //한글 url encoding
//        urlPath = urlPath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        
        let url: URL = URL(string: urlPath)!
        
        DispatchQueue.global().async {
            do{
                
                _ = try Data(contentsOf: url)
                
                //await //담은 데이터를 parseJson으로 ㄴ넘겨 준다.
                DispatchQueue.main.async {
                    result = true
                }
            }catch{
                print("Failed to delete data")
                result = false
            }
            
        }
        return result
        
        
    }
    

}
