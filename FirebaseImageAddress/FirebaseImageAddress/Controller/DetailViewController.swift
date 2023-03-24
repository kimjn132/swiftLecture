//
//  DetailViewController.swift
//  FirebaseImageAddress
//
//  Created by Kenny on 2023/02/15.
//

import UIKit
import FirebaseStorage

class DetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfPhone: UITextField!
    @IBOutlet weak var tfAddress: UITextField!
    @IBOutlet weak var tfRelation: UITextField!
    @IBOutlet weak var imgView: UIImageView!
    
    var documentId = ""
    var name = ""
    var phone = ""
    var address =  ""
    var relation = ""
    var image = ""
    
    let picker = UIImagePickerController()
    var downURL: String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.delegate = self

        // Do any additional setup after loading the view.
        tfName.text = name
        tfName.isUserInteractionEnabled = false
        tfPhone.text = phone
        tfAddress.text = address
        tfRelation.text = relation
        
        downURL = image
        
        displayImage()
    }
    
    func displayImage(){
        let storage = Storage.storage()
        let httpsReference = storage.reference(forURL: image)
                                               
        httpsReference.getData(maxSize: 1 * 1024 * 1024) { data, error in
          if let error = error {
              print("Error : \(error)")
          } else {
              self.imgView.image = UIImage(data: data!)
          }
        }

    }
    
    

    @IBAction func btnChangePhoto(_ sender: UIButton) {
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
    
    @IBAction func btnUpdate(_ sender: UIButton) {
        guard let name = tfName.text else {return}
        guard let phone = tfPhone.text else {return}
        guard let address = tfAddress.text else{return}
        guard let relation = tfRelation.text else {return}
        let image = downURL
        
        let updateModel = UpdateModel()
        let result = updateModel.updateItems(documentId: documentId, name: name, phone: phone, address: address, relation: relation, image: image)
        
        if result == true{
            let resultAlert = UIAlertController(title: "완료", message: "수정이 되었습니다.", preferredStyle: UIAlertController.Style.alert)
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
    
    @IBAction func btnDelete(_ sender: UIButton) {
        // image 삭제
        deleteImage(name: image)

        // DB 삭제
        let deleteModel = DeleteModel()
        let result = deleteModel.deleteItems(documentId: documentId)
        
        if result == true{
            let resultAlert = UIAlertController(title: "완료", message: "삭제가 되었습니다.", preferredStyle: UIAlertController.Style.actionSheet)
            
            let onAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: {ACTION in
                self.navigationController?.popViewController(animated: true) // 현재화면 Close
            })
            resultAlert.addAction(onAction)
            present(resultAlert, animated: true, completion: nil)
        }else{
            let resultAlert = UIAlertController(title: "실패", message: "에러가 발생 되었습니다.", preferredStyle: UIAlertController.Style.actionSheet)
            let onAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
            resultAlert.addAction(onAction)
            present(resultAlert, animated: true, completion: nil)
        }

    }
    
    
    // Photo Library에서 사진 가져오기(함수 이름만 입력하면 준비된 함수임). Print해보면 위치를 알 수 있음.
    // photo Library에서 사진 획득시 image 를 FireStorage에 등록한다.
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            imgView.image = image
        }
        
        // image 삭제
        deleteImage(name: image)
        // image 등록
        insertImage(name: tfName.text!)
        dismiss(animated: true, completion: nil)
        
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

    func deleteImage(name: String){
        // Get a reference to the storage service using the default Firebase App
        let storage = Storage.storage()
        // Note that in the URL, characters are URL escaped!
        let httpsReference = storage.reference(forURL: name)

        httpsReference.delete{ error in
            if let error = error{
                print("Error Delete : \(error)")
            }else{
                print("Successfully Deleted!")
            }
        }

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
