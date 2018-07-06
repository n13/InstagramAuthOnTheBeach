//
//  InstagramAuthViewController.swift
//
//  Created by Nikolaus Heger on 7/3/18.
//  Copyright © 2018 Nikolaus Heger. All rights reserved.
//
import UIKit

open class InstagramAuthViewController: BaseWebViewViewController {
    
    // Instagram Client ID
    public var instagramClientId: String!
    
    // Instagram Redirect URL 
    // This needs to be set to one of the valid redirect URLs in 
    // your instagram client in Manage Clients -> Manage button -> Security tab
    public var instagramRedirectURL: String!
    
    // called with success, token (if any)
    public var doneAction: ( (Bool, String?) -> ())?
    
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        assert(instagramClientId != nil) 
        assert(instagramRedirectURL != nil) 
        let instagramAuthURL = "https://api.instagram.com/oauth/authorize/?client_id=\(instagramClientId!)&redirect_uri=\(instagramRedirectURL.urlEncoded())&response_type=token"
        
        webView.loadURLString(urlString: instagramAuthURL)
    }
    
    override func cancelPressed(_ view: UIView) {
        doneAction = nil
        super.cancelPressed(view)
    }
    
    
    override public func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {        
        if let url = request.url, url.sameHost(urlString: instagramRedirectURL) {            
            if let token = url.instagramAuthorizationToken() {
                // SUCCESS
                doneAction?(true, token)
                return false
            } else {
                // print("Error: Got redirect URL, but no query items")
                // you would think that's the end of it but not necessarily
                // if you used instagram.com as redirect URL, then this will happen a lot - we redirect to another IG page,
                // but not yet to the auth token.
                //doneAction(false, nil)
            }
            
        }
        return !canceled
    }
    
}
