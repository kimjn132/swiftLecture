//
//  JSONModel.swift
//  ServerJson_01
//
//  Created by Anna Kim on 2022/12/24.
//

struct StudentJSON: Codable{
    //json 이름이랑 같아야함
    var code: String
    var name: String
    var dept: String
    var phone: String
    
}

