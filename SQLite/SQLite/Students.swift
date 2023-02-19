//
//  Students.swift
//  SQLite
//
//  Created by Anna Kim on 2022/12/30.
//

import Foundation

//swift는 class 이름과 파일 이름이 같아야 한다.

class Students{
    var id: Int
    var name: String
    var dept: String
    var phone: String
    
    
    init(id: Int, name: String, dept: String, phone: String) {
        self.id = id
        self.name = name
        self.dept = dept
        self.phone = phone
    }
    
}//Students
