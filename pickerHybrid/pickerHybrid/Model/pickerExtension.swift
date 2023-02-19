//
//  pickerExtension.swift
//  PickerView
//
//  Created by Anna Kim on 2022/12/11.
//

import Foundation
import UIKit
import WebKit
//picker list 만들어줌
extension ViewController: UIPickerViewDataSource{
    //picker 외형
    //pickerview의 컬럼 개수
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return pickerViewColumn
    }
    //picker의 raw 넣기
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return maxArrayNum
    }
}

//extension에는 반복 기능이 탑재되어 있다.
extension ViewController: UIPickerViewDelegate{
    //    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    //        return displayName[row]
    //    }
    
    //썸네일 이미지로 picker에 보여주기
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return websiteName[row]
    }
    
    
   // picker 멈추면 화면에 보여줌
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
//        websiteName[row] = "네이버" ? loadWebPage(url: "https://www.naver.com") : websiteName[row] = "구글" ? loadWebPage(url: "https://www.google.com") : websiteName[row] = "다음" ? loadWebPage(url: "https://www.daum.net") : loadWebPage(url: "https://www.nate.net")
        
//        if websiteName[row] == "네이버"{
//            loadWebPage(url: "https://www.naver.com")
//        }else if websiteName[row] == "구글" {
//            loadWebPage(url: "https://www.google.com")
//        }
        
        switch websiteName[row]{
        case "네이버":
            loadWebPage(url: "https://www.naver.com")
        case "구글":
            loadWebPage(url: "https://www.google.com")
        case "다음":
            loadWebPage(url: "https://www.daum.net")
        default : 
            loadWebPage(url: "https://www.yahoo.com")
        
        }
    }
    
    
    
    func loadWebPage(url: String){
        let myUrl = URL(string: url)
        guard let myUrl2 = myUrl else {return}
        let myRequest = URLRequest(url: myUrl2)
        webSites.load(myRequest)
    }
    
    
    
    
    
    
}//end
