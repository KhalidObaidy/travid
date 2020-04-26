//
//  WebViewController.swift
//  TRAVID
//
//  Created by MOHAMMED ALOBAIDY on 4/22/20.
//  Copyright © 2020 Khalid Alobaidi. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController, WKNavigationDelegate {

    
    
    
    var webView : WKWebView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
 
        // loading URL :
        let myBlog = "https://integrations.eu-gb.assistant.watson.cloud.ibm.com/web/public/a6c3aaf9-6487-45bb-a57e-93d420e9a5c3"
        let url = NSURL(string: myBlog)
        let request = NSURLRequest(url: url! as URL)// init and load request in webview.
        webView = WKWebView(frame: self.view.frame)
        webView.navigationDelegate = self
        webView.load(request as URLRequest)
        self.view.addSubview(webView)
        self.view.sendSubviewToBack(webView)
        
        
        

       // WebView.loadRequest(NSURLRequest(url: NSURL(string: "www.google.com")! as URL) as URLRequest)
        

    }
    
    

    
    private func webView(webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: NSError) {
    print(error.localizedDescription)
    
    }
    
    private func webView(webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        print("Strat to load")
    }
    
    
    private func webView(webView: WKWebView, didFinishNavigation navigation: WKNavigation!) {
        print("finish to load")
    }
    
    
    
    
    
    
    
    

}





    
    
