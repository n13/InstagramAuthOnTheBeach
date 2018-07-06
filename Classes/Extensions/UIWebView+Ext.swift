//
//  UIWebView+Ext.swift
//
//  Created by Nikolaus Heger on 7/3/18.
//  Copyright © 2018 Nikolaus Heger. All rights reserved.
//

import UIKit

extension UIWebView {
    func loadURLString(urlString: String) {
        if let url = URL(string: urlString) {
            loadRequest(URLRequest(url: url))
        } else {
            print("Error: loadURLString: Not a URL, ignored: \(urlString)")
        }
    }
    var url:URL? {
        get {
            return request?.url
        }
    }
}
