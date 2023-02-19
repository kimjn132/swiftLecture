//
//  TodoList.swift
//  tabControlImage
//
//  Created by Anna Kim on 2022/12/31.
//

struct TodoList{
    var items: String
    var itemsImageFile: String
    
    //instance
    init(items: String, itemsImageFile: String) {
        self.items = items
        self.itemsImageFile = itemsImageFile
    }
}
