//
//  AddViewController.swift
//  FirebaseImageAddress
//
//  Created by Kenny on 2023/02/14.
//

import UIKit
import FirebaseCore // <<<
import FirebaseStorage // <<<<
import FirebaseAuth // <<<


class AddViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate { // Photo Library Picker관련 Class 추가

    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfPhone: UITextField!
    @IBOutlet weak var tfAddress: UITextField!
    @IBOutlet weak var tfRelation: UITextField!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var btnPhoto: UIButton! // Enable Diable Button
    
    let picker = UIImagePickerController()
    var downURL: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        picker.delegate = self
    }
    
    // Enable Diable Button
    @IBAction func nameCheck(_ sender: UITextField) {
        if !tfName.text!.trimmingCharacters(in: .whitespaces).isEmpty{
            btnPhoto.isEnabled = true
        }
    }
    
    
    
    
    @IBAction func btnLoadPhoto(_ sender: UIButton) {
        let photoAlert = UIAlertController(title: "사진 가져오기", message: "Photo Library에서 사진을 가져 옵니다.", preferredStyle: UIAlertController.Style.actionSheet) // Alert가 화면 밑에서 돌출
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: {ACTION in
            self.picker.sourceType = .photoLibrary
            self.present(self.picker, animated: false, completion: nil) // animated: true로 해서 차이점을 확인해 보세요!
        })
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        photoAlert.addAction(okAction)
        photoAlert.addAction(cancelAction)
        
        present(photoAlert, animated: true, completion: nil)

    }
    
    @IBAction func btnInsert(_ sender: UIButton) {
        guard let name = tfName.text else {return}
        guard let phone = tfPhone.text else {return}
        guard let address = tfAddress.text else {return}
        guard let relation = tfRelation.text else {return}
        var image = ""
        
        // Firebase Storage에 주소 URL로 저장
        image = downURL
        
        if !name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty{
            let insertModel = InsertModel()
            let result = insertModel.insertItems(name: name, phone: phone, address: address, relation: relation, image: image)
            if result == true{
                let resultAlert = UIAlertController(title: "완료", message: "입력이 되었습니다.", preferredStyle: UIAlertController.Style.alert)
                let onAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: {ACTION in
                    self.navigationController?.popViewController(animated: true) // 현재화면 Close
                })
                resultAlert.addAction(onAction)
                present(resultAlert, animated: true, completion: nil)

            }else{
                let resultAlert = UIAlertController(title: "실패", message: "에러가 발생 되었습니다.", preferredStyle: UIAlertController.Style.alert)
                let onAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
                resultAlert.addAction(onAction)
                present(resultAlert, animated: true, completion: nil)

            }
        }
    }

    func insertImage(name: String){
        let storageRef = Storage.storage().reference()
        
        // File located on disk
        let image = imgView.image!
        guard let imageData = image.jpegData(compressionQuality: 0.4) else { return }
        
        // Create a reference to the file you want to upload
        let imageRef = storageRef.child("images/\(name).jpg")

        // Meta data
        let metadata = StorageMetadata()
        metadata.contentType = "image/jpg"
        
        // Upload the file to the path "images/rivers.jpg"
        imageRef.putData(imageData, metadata: metadata) { metadata, error in
            guard metadata != nil else {
            print("Error : putfile")
            return
          }
          // You can also access to download URL after upload.
            imageRef.downloadURL { (url, error) in
            guard let downloadURL = url else {
              print("Error : DownloadURL")
              return
            }
              self.downURL = "\(downloadURL)"
                print(self.downURL)
          }
        }
        print("--- Completed to insert a image ----")

    }
    
    
    
    // Photo Library에서 사진 가져오기(함수 이름만 입력하면 준비된 함수임). Print해보면 위치를 알 수 있음.
    // photo Library에서 사진 획득시 image 를 FireStorage에 등록한다.
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            imgView.image = image
        }
        
        // image 등록
        insertImage(name: tfName.text!)
        dismiss(animated: true, completion: nil)
        
    }

    /*
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
