//
//  pickerExtension.swift
//  PickerView
//
//  Created by Anna Kim on 2022/12/11.
//

import Foundation
import UIKit


//picker list 만들어줌
extension ViewController: UIPickerViewDataSource{
    // 자동완성: override??
    //picker 외형
    //pickerview의 컬럼 개수
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    //picker의 raw 개수
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return imageArray.count
    }
}

//extension에는 반복 기능이 탑재되어 있다.
// data 넣고 함수 실행하는 역할(delegate)
extension ViewController: UIPickerViewDelegate{
    //    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    //        return displayName[row]
    //    }
    
    //썸네일 이미지로 picker에 보여주기
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let imageView = UIImageView(image: imageArray[row])
        imageView.frame = CGRect(x: 0, y: 0, width: 50, height: 20)
        return imageView
    }
    
    //picker 멈추면 화면에 보여줌
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        lblImageFileName.text = "Selected Item : \(imageFileName[row])"
        imageView.image = imageArray[row]
        
    }
}


