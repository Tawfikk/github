//
//  RepoWebView.swift
//  github
//
//  Created by Abdullah Tawfik on 19/02/2018.
//  Copyright © 2018 Abdullah Tawfik. All rights reserved.
//

import UIKit
import WebKit

class RepoWebView: UIViewController, WKNavigationDelegate {
    
    var url: URL?
    var repoName: String? 
    var webView: WKWebView!    
    
    // MARK: - Outlets 🔌
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    // MARK: - LifeCycle 🌍
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        let request = URLRequest(url: url!)
        webView.load(request)
    }
    
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        print("Start")        
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        title = repoName        
        print("Finish")
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        spinner.stopAnimating()
    }
}

// MARK: - Setup 🔨
private extension RepoWebView {
    func setup() {
        webViewInit()
    }
    
    func webViewInit() {
        view = webView
        webView = WKWebView()
        webView.navigationDelegate = self        
        webView.allowsBackForwardNavigationGestures = true
    }
    
    func addShareButton() {
        
    }
    
}
