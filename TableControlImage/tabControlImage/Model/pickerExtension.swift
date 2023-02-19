//
//  pickerExtension.swift
//  tabControlImage
//
//  Created by Anna Kim on 2022/12/31.
//

import Foundation
import UIKit

//picker list 만들어줌
extension AddViewController: UIPickerViewDataSource{
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
extension AddViewController: UIPickerViewDelegate{
    //    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    //        return displayName[row]
    //    }
    
    //썸네일 이미지로 picker에 보여주기
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let imageView = UIImageView(image: imageArray[row])
        imageView.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        return imageView
    }
    
    //picker 멈추면 화면에 보여줌
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        Message.rowNum = row
        imgView.image = imageArray[row]
        
    }
}

