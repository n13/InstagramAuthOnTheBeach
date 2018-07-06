//
//  ViewController.swift
//  InstagramAuthOnTheBeach
//
//  Created by n13 on 07/06/2018.
//  Copyright (c) 2018 n13. All rights reserved.
//

import UIKit
import InstagramAuthOnTheBeach

class ViewController: UIViewController {

    @IBOutlet weak var textLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buttonPressed() {
        // This is good for testing as IG caches your login in the URL Session 
        // comment this out to reset things, and let it forget all the cached
        // cookies.
        
        // URLSession.shared.reset {
        //   print("reset all caches")
        // }
        
        // Create a new Instagram Auth View Controller
        let vc = InstagramAuthViewController()
        
        // Set the Instagram specific variables for your client
        vc.instagramClientId = "deb0a066f1394cd29bdf20a53c26e666"
        // For the redirect URL, make sure it's one of the allowed URLs on your client
        // Others use https://www.instagram.com/ but that makes detecting the URL more difficult as 
        // IG makes dozens of calls to this url and we then have to filter out the right one
        vc.instagramRedirectURL = "https://connect.earth/"
        
        vc.doneAction = { [weak self] success, token in 
            
            self?.dismiss(animated: true, completion: nil)
            
            if (success) {
                print("Great, you did it!")
            }
            
            print("IG TOKEN: \(String(describing: token))")
            
            if let tk = token {
                self?.textLabel?.text = "Your Instagram Auth Token \n" + tk + "\n🦄"
            }
            
            // I leave it up to you to install Alamofire or whatever and do something with the token
            // this is an example
            let urlString = "https://api.instagram.com/v1/users/self/?access_token=\(token!)"            
//            Alamofire.request(urlString).responseJSON { [weak self] response in
//                if let error = response.error {
//                    print("failed with error \(error)")
//                    return
//                } 
//                var responseJson = response.result.value as? [String: Any] ?? [:]                
//                if let data = responseJson["data"] as? [String:Any], let username = data["username"] as? String {
//                    let userId = data["id"] as? String
//                    let fullName = data["full_name"] as? String
//                    print("USERNAME: \(username)")
//                    print("id: \(String(describing: userId))")
//                    print("real name: \(String(describing: fullName))")
//                }
//            }
        }
        
        present(UINavigationController(rootViewController: vc), animated: true);
        
    }

}

