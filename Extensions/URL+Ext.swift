//
//  URL+Ext.swift
//
//  Created by Nikolaus Heger on 7/3/18.
//  Copyright © 2018 Nikolaus Heger. All rights reserved.
//
import Foundation

extension URL {
    func queryItem(withName name: String) -> String? {
        // I'd make this a one-liner but then it'd be too confusing. Hella cool though with tons of optional chaining.
        let components = URLComponents(url: self, resolvingAgainstBaseURL: false)
        return components?.queryItems?.filter { $0.name == name }.first?.value
    }
    
    // Instagram developer documentation states that the auth token comes in form of a fragment
    // like this:
    //      https://www.your_user_defined_redirect_url.com/#access_token=blahblahblah
    //
    func instagramAuthorizationToken() -> String? {
        let components = URLComponents(url: self, resolvingAgainstBaseURL: false)
        let fragment = components?.fragment
        if let s = fragment?.split(separator: "="), s.count > 1 {
            if s[0] == "access_token" {
                return String(s[1])
            }
        }
        return nil
    }
    
    func sameHost(urlString: String) -> Bool {
        if let url = URL(string: urlString) {
            return url.host == host
        }
        return false
    }
}
