//
//  TodoList.swift
//  Table
//
//  Created by Anna Kim on 2022/12/23.
//

//struct는 상속 불가, class는 상속 가능


//데이터 담는 곳 
struct TodoList{
    var items: String
    var itemsImageFile: String
    
    //생성자
    init(items: String, itemsImageFile: String){
        self.items = items
        self.itemsImageFile = itemsImageFile
    }
    
    //
}
