//
//  ViewController.swift
//  tabbarWebpage
//
//  Created by Anna Kim on 2022/12/23.
//

import UIKit
import WebKit

class daumViewController: UIViewController {

    
    @IBOutlet weak var myWebView: WKWebView!
    @IBOutlet weak var myActivityIndicator: UIActivityIndicatorView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myWebView.navigationDelegate = self
        
        loadWebPage(url: "https://www.daum.com")
    }

    
    func loadWebPage(url: String){
        let myUrl = URL(string: url)
        guard let myUrl2 = myUrl else {return}
        let myRequest = URLRequest(url: myUrl2)
        myWebView.load(myRequest)
    }

}//viewcontroller

//indicator
extension daumViewController: WKNavigationDelegate{
    // indicator 시작
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        myActivityIndicator.startAnimating()
        myActivityIndicator.isHidden = false
    }
    // indicator 종료
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        myActivityIndicator.stopAnimating()
        myActivityIndicator.isHidden = true
    }
    
    // Error 발생
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        myActivityIndicator.stopAnimating()
        myActivityIndicator.isHidden = true

    }
}

