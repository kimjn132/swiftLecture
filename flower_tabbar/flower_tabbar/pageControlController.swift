//
//  ViewController.swift
//  PageControl
//
//  Created by Anna Kim on 2022/12/16.
//

import UIKit

class pageControlController: UIViewController {

    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var images = ["flower_01.png", "flower_02.png", "flower_03.png", "flower_04.png", "flower_05.png", "flower_06.png"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        pageControl.numberOfPages = images.count        // 페이지 수 (=이미지수)
        pageControl.currentPage = 0 //0 번째부터
        pageControl.pageIndicatorTintColor = UIColor.green
        pageControl.currentPageIndicatorTintColor = UIColor.red
        
        imgView.image = UIImage(named: images[pageControl.currentPage])
    }

    
    @IBAction func pageChange(_ sender: UIPageControl) {
        //++해줄 필요 없다. 
        imgView.image = UIImage(named: images[pageControl.currentPage])
    }
    
    

}

