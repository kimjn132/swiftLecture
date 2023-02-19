//
//  DBModel.swift
//  ServerJsonImageMovieList
//
//  Created by Anna Kim on 2022/12/31.
//

import Foundation

class DBModel{
    var imageName: String
    var title: String
    
    init(imageName: String, title: String) {
        self.imageName = imageName
        self.title = title
    }
}
