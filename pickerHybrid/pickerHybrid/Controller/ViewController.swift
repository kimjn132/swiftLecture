//
//  ViewController.swift
//  pickerHybrid
//
//  Created by Anna Kim on 2022/12/17.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet weak var pkSites: UIPickerView!
    @IBOutlet weak var webSites: WKWebView!
    @IBOutlet weak var myIndicator: UIActivityIndicatorView!
    
    
    //웹사이트 이름(show 용 in pickerView)
    var websiteName = ["네이버", "구글", "다음", "야후"]
    //웹사이트 url
    
    
    //pickerview 모습
    var maxArrayNum = 0
    //보통 컬럼 두개로 하지 않고, pickerview를 따로 하나씩 만든다.
    let pickerViewColumn = 1
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // pickerView의 raw 개수 (count)
        maxArrayNum = websiteName.count
        
        webSites.navigationDelegate = self
        
        loadWebPage(url: "https://www.naver.com")
        
        //extension에서의 메소드를 실행시킴
        pkSites.dataSource = self
        pkSites.delegate = self
    }


    
    
    
}//view

extension ViewController: WKNavigationDelegate{
    // indicator 시작
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        myIndicator.startAnimating()
        myIndicator.isHidden = false
    }
    // indicator 종료
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        myIndicator.stopAnimating()
        myIndicator.isHidden = true
    }
    
    // Error 발생
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        myIndicator.stopAnimating()
        myIndicator.isHidden = true
        
    }
}


