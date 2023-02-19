//
//  ViewController.swift
//  Hybrid
//
//  Created by Anna Kim on 2022/12/11.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    
    @IBOutlet weak var tfUrl: UITextField!
    @IBOutlet weak var myWebView: WKWebView!
    @IBOutlet weak var myActivityIndicator: UIActivityIndicatorView!
    //Hide When Stopped 체크해놔야 됨!!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        myWebView.navigationDelegate = self
        
        loadWebPage(url: "https://www.naver.com")
        //protocol
    }

    
    func loadWebPage(url: String){
        let myUrl = URL(string: url)
        guard let myUrl2 = myUrl else {return}
        let myRequest = URLRequest(url: myUrl2)
        myWebView.load(myRequest)
    }
    
    
    @IBAction func btnGo(_ sender: UIButton) {
        guard let urlTf = tfUrl.text else{return}
        let myUrl = checkUrl(urlTf)
        tfUrl.text = ""
        loadWebPage(url: myUrl)
        
    }
    
    
    func checkUrl(_ url: String) -> String{
        var strUrl = url
        let flag = strUrl.hasPrefix("http://")  //hasPrefix: 문자열의 앞글자
        let flag2 = strUrl.hasPrefix("https://")
        
        if !(flag || flag2){
            strUrl = "https://"+strUrl
        }
        return strUrl
    }
    
    
    
    @IBAction func btnGoogle(_ sender: UIButton) {
        loadWebPage(url: "https://www.google.com")
    }
    
    @IBAction func btnDaum(_ sender: UIButton) {
        loadWebPage(url: "https://www.daum.net")
    }
    
    
    
    
    @IBAction func btnHtml(_ sender: UIButton) {
      let htmlString = """
        <html>
            <head>
                <meta charset="utf-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
            </head>
            <body>
                <h1>HTML String</h1>
                <p>String변수를 이용한 웹페이지</p>
                <p><a href="https://jtbc.co.kr">JTBC</a>로 이동</p>
            </body>
        </html>
    """
        myWebView.loadHTMLString(htmlString, baseURL: nil)
    }
    
    
    @IBAction func btnFile(_ sender: UIButton) {
        //파일 경로
        let filePath = Bundle.main.path(forResource: "htmlView", ofType: "html")
        guard let filePath2 = filePath else{return}
        let myUrl = URL(filePath: filePath2)
        //let myUrl = URL(fileURLWithPath: filePath2)
        let myRequest = URLRequest(url: myUrl)
        myWebView.load(myRequest)
    }
    
    
    
    
    
    
    @IBAction func btnStop(_ sender: UIBarButtonItem) {
        myWebView.stopLoading()
    }
    
    @IBAction func btnReload(_ sender: UIBarButtonItem) {
        myWebView.reload()
    }
    
    @IBAction func btnGoBack(_ sender: UIBarButtonItem) {
        myWebView.goBack()
    }
    
    
    @IBAction func btnForward(_ sender: UIBarButtonItem) {
        myWebView.goForward()
    }
    
    

}// ViewController


extension ViewController: WKNavigationDelegate{
    
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
}//viewcontroller extension

