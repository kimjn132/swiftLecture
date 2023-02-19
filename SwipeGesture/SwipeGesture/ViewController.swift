//
//  ViewController.swift
//  SwipeGesture
//
//  Created by Anna Kim on 2022/12/16.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var imgViewUp: UIImageView!
    @IBOutlet weak var imgViewDown: UIImageView!
    @IBOutlet weak var imgViewLeft: UIImageView!
    @IBOutlet weak var imgViewRight: UIImageView!
    
    //up 이미지에 화살표 여러개 필요함 >>. 배열 사용
    var imgLeft = [UIImage]()
    var imgRight = [UIImage]()
    var imgUp = [UIImage]()
    var imgDown = [UIImage]()
    
    //두손가락 변수
    let numOfTouches = 2
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Image 설정하기
        makeImages()
        
        //초기 이미지
        imgViewUp.image = imgUp[0]
        imgViewDown.image = imgDown[0]
        imgViewLeft.image = imgLeft[0]
        imgViewRight.image = imgRight[0]
        
        // 한손가락 Gesture 구성
        makeSingleTouch()
        
        //두손가락 Gesture 구성
        makeDoubleTouch()
        
        }//viewdidload
    
        
    func makeImages(){
        
        imgUp.append(UIImage(named: "arrow-up-black.png")!)//기본
        imgUp.append(UIImage(named: "arrow-up-red.png")!)//한손가락
        imgUp.append(UIImage(named: "arrow-up-green.png")!)//두손가락
        
        imgDown.append(UIImage(named: "arrow-down-black.png")!)//기본
        imgDown.append(UIImage(named: "arrow-down-red.png")!)//한손가락
        imgDown.append(UIImage(named: "arrow-down-green.png")!)//두손가락
        
        imgLeft.append(UIImage(named: "arrow-left-black.png")!)//기본
        imgLeft.append(UIImage(named: "arrow-left-red.png")!)//한손가락
        imgLeft.append(UIImage(named: "arrow-left-green.png")!)//두손가락
        
        imgRight.append(UIImage(named: "arrow-right-black.png")!)//기본
        imgRight.append(UIImage(named: "arrow-right-red.png")!)//한손가락
        imgRight.append(UIImage(named: "arrow-right-green.png")!)//두손가락
        
        
       
    }//makeImages
    
    
    func makeSingleTouch(){
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_ :)))
        swipeUp.direction = UISwipeGestureRecognizer.Direction.up
        self.view.addGestureRecognizer(swipeUp) //신호 주기
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_ :)))
        swipeDown.direction = UISwipeGestureRecognizer.Direction.down
        self.view.addGestureRecognizer(swipeDown) //신호 주기
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_ :)))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        self.view.addGestureRecognizer(swipeLeft) //신호 주기
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_ :)))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        self.view.addGestureRecognizer(swipeRight) //신호 주기
        
    }//makeSingleTouch()

    
    @objc func respondToSwipeGesture(_ gesture:UIGestureRecognizer){
       //nil값 체크, UIGEstureRecognizer가 신호 받아서 >> gesture로 변환(as를 통해서 )
        if let swipeGesture = gesture as? UISwipeGestureRecognizer{
            
            imgViewUp.image = imgUp[0]
            imgViewDown.image = imgDown[0]
            imgViewLeft.image = imgLeft[0]
            imgViewRight.image = imgRight[0]
            
            switch swipeGesture.direction{
            case UISwipeGestureRecognizer.Direction.up:
                imgViewUp.image = imgUp[1]
            case UISwipeGestureRecognizer.Direction.down:
                imgViewDown.image = imgDown[1]
            case UISwipeGestureRecognizer.Direction.right:
                imgViewRight.image = imgRight[1]
            case UISwipeGestureRecognizer.Direction.left:
                imgViewLeft.image = imgLeft[1]
            default:
                break
            }
        }//if
        
    }// respondToSwipeGesture
    
    
    func makeDoubleTouch(){
        let swipeUpMulti = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGestureMulti(_ :)))
        swipeUpMulti.direction = UISwipeGestureRecognizer.Direction.up
        swipeUpMulti.numberOfTouchesRequired = numOfTouches
        self.view.addGestureRecognizer(swipeUpMulti) //신호 주기
        
        let swipeDownMulti = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGestureMulti(_ :)))
        swipeDownMulti.direction = UISwipeGestureRecognizer.Direction.down
        swipeDownMulti.numberOfTouchesRequired = numOfTouches
        self.view.addGestureRecognizer(swipeDownMulti) //신호 주기
        
        let swipeLeftMulti = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGestureMulti(_ :)))
        swipeLeftMulti.direction = UISwipeGestureRecognizer.Direction.left
        swipeLeftMulti.numberOfTouchesRequired = numOfTouches
        self.view.addGestureRecognizer(swipeLeftMulti) //신호 주기
        
        let swipeRightMulti = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGestureMulti(_ :)))
        swipeRightMulti.direction = UISwipeGestureRecognizer.Direction.right
        swipeRightMulti.numberOfTouchesRequired = numOfTouches
        self.view.addGestureRecognizer(swipeRightMulti) //신호 주기
        
       
    }//makeDoubleTouch
    
    
    @objc func respondToSwipeGestureMulti(_ gesture:UIGestureRecognizer){
       //nil값 체크, UIGEstureRecognizer가 신호 받아서 >> gesture로 변환(as를 통해서 )
        if let swipeGesture = gesture as? UISwipeGestureRecognizer{
            
            imgViewUp.image = imgUp[0]
            imgViewDown.image = imgDown[0]
            imgViewLeft.image = imgLeft[0]
            imgViewRight.image = imgRight[0]
            
            switch swipeGesture.direction{
            case UISwipeGestureRecognizer.Direction.up:
                imgViewUp.image = imgUp[2]
            case UISwipeGestureRecognizer.Direction.down:
                imgViewDown.image = imgDown[2]
            case UISwipeGestureRecognizer.Direction.right:
                imgViewRight.image = imgRight[2]
            case UISwipeGestureRecognizer.Direction.left:
                imgViewLeft.image = imgLeft[2]
            default:
                break
            }
        }//if
        
    }// respondToSwipeGestureMulti
    
    

}//end

