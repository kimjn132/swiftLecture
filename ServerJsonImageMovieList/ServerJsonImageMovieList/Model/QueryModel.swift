//
//  QueryModel.swift
//  ServerJsonImageMovieList
//
//  Created by Anna Kim on 2022/12/31.
//

import Foundation

protocol QueryModelProtocol{
    func itemDownloaded(items: [DBModel])
}

class QueryModel{
    var delegate: QueryModelProtocol!
    
    //".jsp"로 바꾸면 jsp로 바꾸기만 하면 똑같다.
    let urlPath = "https://zeushahn.github.io/Test/ios/movies.json"
    
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
            let images = try decoder.decode([ImageJson].self, from: data)
            for image in images {
                let query = DBModel(imageName: image.image, title: image.title)
                locations.append(query)
            }
            
            print(images.count)
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

