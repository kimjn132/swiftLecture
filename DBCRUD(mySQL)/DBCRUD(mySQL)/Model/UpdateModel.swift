//
//  UpdateModel.swift
//  DBCRUD(mySQL)
//
//  Created by Anna Kim on 2022/12/31.
//

import Foundation


class UpdateModel{
    
    var urlPath = "http://localhost:8080/ios/studentUpdate_ios.jsp"
    // https 안된다.
    
    func updateItems(name: String, dept: String, phone: String, code: String) -> Bool{
        var result: Bool = true
        let urlUpdate = "?name=\(name)&dept=\(dept)&phone=\(phone)&code=\(code)"
        urlPath = urlPath + urlUpdate
        
        //한글 url encoding
        urlPath = urlPath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        
        let url: URL = URL(string: urlPath)!
        
        DispatchQueue.global().async {
            do{
                //?은 옵셔널이 아니라 catch 대신  //  data에 데이터가 담겨 있다.
                //do 안에 들어오면 ? 없앤다.
                _ = try Data(contentsOf: url)
                
                //await //담은 데이터를 parseJson으로 ㄴ넘겨 준다.
                DispatchQueue.main.async {
                    result = true
                }
            }catch{
                print("Failed to update data")
                result = false
            }
            
               
            
        }
        return result
        
        
    }
    
    
    
    
   
      
}
