//
//  BaseWebViewViewController.swift
//
//  Created by Nikolaus Heger on 7/3/18.
//  Copyright © 2018 Nikolaus Heger. All rights reserved.
//

import UIKit

fileprivate extension Selector {
    static let cancelPressed = 
        #selector(BaseWebViewViewController.cancelPressed(_:))
}

open class BaseWebViewViewController: UIViewController {
    let webView = UIWebView()
    var canceled = false
    var doneBlock: ((_: Bool) -> ())?
    
    override open func viewDidLoad() {
        navigationItem.leftBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: .cancel, target: self, action: .cancelPressed )
        
        webView.delegate = self
        
        view._add(webView, constraints: [
            webView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            webView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            webView.topAnchor.constraint(equalTo: view.topAnchor),
            webView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            ])        
    }
    
    @objc func cancelPressed(_: UIView) {
        canceled = true
        webView.stopLoading()
        dismiss(animated: true)
    }
}

extension BaseWebViewViewController: UIWebViewDelegate {
    public func webViewDidStartLoad(_ webView: UIWebView) {
        //print("did start loading..\(String(describing: webView.request?.url))")
        
    }
    public func webViewDidFinishLoad(_ webView: UIWebView) {
        //print("did finish loading \(webView.url.orNil)")
    }
    public func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        //print("failed to load: \(webView.url.orNil)")
    }
    public func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        //print("should start loading: \((request.url?.absoluteString).orNil)")
        return !canceled
    }
}


