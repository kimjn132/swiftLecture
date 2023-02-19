//
//  ViewController.swift
//  PictureSwipe
//
//  Created by Anna Kim on 2022/12/17.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var images = ["flower_01.png", "flower_02.png", "flower_03.png", "flower_04.png", "flower_05.png", "flower_06.png"]
    
    var left = [0]
    var right = [0]
    
    var numImage = 0
    var numImage2 = 0
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        //page control
        pageControl.numberOfPages = images.count        // 페이지 수 (=이미지수)
        pageControl.currentPage = 0 //0 번째부터
        pageControl.pageIndicatorTintColor = UIColor.green
        pageControl.currentPageIndicatorTintColor = UIColor.red
        
        imgView.image = UIImage(named: images[pageControl.currentPage])
        
        
        // 한손가락 Gesture 구성
        makeSingleTouch()
        
        
        
    }


    
    
    @IBAction func pageChange(_ sender: UIPageControl) {
        imgView.image = UIImage(named: images[pageControl.currentPage])
        
        
        
    }
    
    func makeSingleTouch(){
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGestureLeft(_ :)))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        self.view.addGestureRecognizer(swipeLeft) //신호 주기

        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGestureRight(_ :)))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        self.view.addGestureRecognizer(swipeRight) //신호 주기
    }

    
    @objc func respondToSwipeGestureRight(_ gesture:UIGestureRecognizer){
       //nil값 체크, UIGEstureRecognizer가 신호 받아서 >> gesture로 변환(as를 통해서 )
        if let swipeGesture = gesture as? UISwipeGestureRecognizer{
            
            numImage += 1
            
            
            switch swipeGesture.direction{
            case UISwipeGestureRecognizer.Direction.right:
                if numImage >= images.count{
                    numImage = 0
                }else{
                    imgView.image = UIImage(named: images[numImage])
                }
            default:
                break
            }
           
            
            
            
        }//if
        
    }// respondToSwipeGesture right
    
    
    @objc func respondToSwipeGestureLeft(_ gesture:UIGestureRecognizer){
       //nil값 체크, UIGEstureRecognizer가 신호 받아서 >> gesture로 변환(as를 통해서 )
        if let swipeGesture = gesture as? UISwipeGestureRecognizer{


            numImage2 = numImage2 - 1

            switch swipeGesture.direction{
            case UISwipeGestureRecognizer.Direction.left:
                if (numImage2 < 0) {
                    numImage2 = images.count-1
                } //
                imgView.image = UIImage(named: images[numImage2])
            default:
                break
            }




        }//if

    }// respondToSwipeGesture right

    
    
}// ViewController

