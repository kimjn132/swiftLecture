//
//  DBModel.swift
//  ServerJson_01
//
//  Created by Anna Kim on 2022/12/24.
//

import Foundation

class DBModel{
    // Properties
    var scode: String
    var sname: String
    var sdept: String
    var sphone: String
    
    //Constructor
    init(scode: String, sname: String, sdept: String, sphone: String) {
        self.scode = scode
        self.sname = sname
        self.sdept = sdept
        self.sphone = sphone
    }
}
