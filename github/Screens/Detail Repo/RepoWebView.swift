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
    
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    // MARK: - LifeCycle 🌍
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        
        webView.navigationDelegate = self
        webView.allowsBackForwardNavigationGestures = true
        
        let request = URLRequest(url: url!)
        webView.load(request)
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        title = repoName
        spinner.stopAnimating()
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        spinner.stopAnimating()
    }
}

// MARK: - Setup 🔨
private extension RepoWebView {
    
    func setup() {
        shareButton()
    }
    
    func shareButton() {
        let button = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(shareLink))
        self.navigationItem.rightBarButtonItem = button
    }
    
    @objc func shareLink() {
        guard let repoLink = url else { return }
        let vc = UIActivityViewController(activityItems: [repoLink], applicationActivities: [])
        present(vc, animated: true)
    }
    
}
