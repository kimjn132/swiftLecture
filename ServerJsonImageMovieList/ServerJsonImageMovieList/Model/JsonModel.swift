//
//  JsonModel.swift
//  ServerJsonImageMovieList
//
//  Created by Anna Kim on 2022/12/31.
//

import Foundation

//struct는 파일 이름 상관 없음, class만 상관 있음

struct ImageJson: Codable{
    var image: String
    var title: String
}
