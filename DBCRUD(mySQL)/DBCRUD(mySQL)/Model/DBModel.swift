//
//  DBModel.swift
//  DBCRUD(mySQL)
//
//  Created by Anna Kim on 2022/12/31.
//

import Foundation

struct DBModel{
    
    var scode: String
    var sname: String
    var sdept: String
    var sphone: String
    
    
    init(scode: String, sname: String, sdept: String, sphone: String) {
        self.scode = scode
        self.sname = sname
        self.sdept = sdept
        self.sphone = sphone
    }
    
}//DBModel
