//
//  QueryModel.swift
//  ServerJson_01
//
//  Created by Anna Kim on 2022/12/24.
//

import Foundation

//protocol: 뒤에 있는 애가 데이터를 주고 실행시켜 준다.

//protocol 연결자(이미 떠있는 class에 데이터 주는 방법, 새롭게 안 만들고..)
protocol QueryModelProtocol{
    func itemDownloaded(items: [DBModel])
}

class QueryModel{
    var delegate: QueryModelProtocol!
    let urlPath = "https://zeushahn.github.io/Test/ios/student.json"
    
    func downloadItems(){
        
        let url: URL = URL(string: urlPath)!
        
        DispatchQueue.global().async {
            //?은 옵셔널이 아니라 catch 대신  //  data에 데이터가 담겨 있다.
            let data = try? Data(contentsOf: url)
            
            //await //담은 데이터를 parseJson으로 ㄴ넘겨 준다.
            DispatchQueue.main.async {
                self.parseJSON(data!)
            }
        }
        
        
        
        
    
    }//
    
    
    
    func parseJSON(_ data: Data){
        let decoder = JSONDecoder()
        var locations: [DBModel] = []
        
        do{
            let students = try decoder.decode([StudentJSON].self, from: data)
            for student in students {
                let query = DBModel(simage: students.imageName, sname: students.name, sphone: students.phone)
                locations.append(query)
            }
            
            print(students.count)
        }catch let error{
            print("Fail : \(error.localizedDescription)")
        }
        
        //dispatch가 tableviewcontroller에 연결된 친구에게 연결시켜준다.(실제로 연결된 곳으로 데이터를 준다.)
//        DispatchQueue.main.async{(execute: {() -> Void in}
//            self.delegate.itemDownloaded(items: locations)
//        })
        
        
        //이제 클로저를 사용 안해도 된다.
        DispatchQueue.main.async{
            self.delegate.itemDownloaded(items: locations)
        }
        
    }
    
    
}// end

