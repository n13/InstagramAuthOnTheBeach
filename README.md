# InstagramAuthOnTheBeach

[![CI Status](https://img.shields.io/travis/n13/InstagramAuthOnTheBeach.svg?style=flat)](https://travis-ci.org/n13/InstagramAuthOnTheBeach)
[![Version](https://img.shields.io/cocoapods/v/InstagramAuthOnTheBeach.svg?style=flat)](https://cocoapods.org/pods/InstagramAuthOnTheBeach)
[![License](https://img.shields.io/cocoapods/l/InstagramAuthOnTheBeach.svg?style=flat)](https://cocoapods.org/pods/InstagramAuthOnTheBeach)
[![Platform](https://img.shields.io/cocoapods/p/InstagramAuthOnTheBeach.svg?style=flat)](https://cocoapods.org/pods/InstagramAuthOnTheBeach)

## Overview

Precise authentication with Instagram API, not more not less. Unlike the other Instagram auth solutions out there, this one works. Hopefully they'll fix their code soon though.

Client side OAUTH - no need for a server component.

It works like this
1. Pop a view controller of type InstagramAuthViewController
2. Set your Instagram client ID and redirect URL
3. Receive an auth token
4. Call into the [Instagram API]https://www.instagram.com/developer/) using the auth token 

I recommend using Alamofire or something reasonable like that to make the API calls - there's an example in the Example project

This pod only takes care of the really messy stuff, which is obtaining the auth token. The reason that is very messy is that we need to show a web page controlled by Instagram, and depending on many different things this page might change, have different content, have a facebook login button, all sorts of things could happen. 

I tried two other Instagram authentication pods before writing this. Both didn't work. One of them didn't even handle the messy stuff that InstagramAuthOnTheBeach handles.

The instagram API is very clean and well documented. I don't see a need to wrap these calls into another opaque layer. Authentication is the only part that's messy and that this pod solves for you.

## Code Example

```
let vc = InstagramAuthViewController()
vc.instagramClientId = "YOUR-CLIENT-ID-HERE"
vc.instagramRedirectURL = "YOUR-REDIRECT-URL-HERE"
vc.doneAction = { [weak self] success, token in 

    // ... do what you want with the token....
    
    self?.dismiss(animated: true, completion: nil)

}

present(UINavigationController(rootViewController: vc), animated: true);

```

## Example Project

Check it out!!! 

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

InstagramAuthOnTheBeach is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'InstagramAuthOnTheBeach'
```

## Author

n13, nheger@gmail.com

## License

InstagramAuthOnTheBeach is available under the MIT license. See the LICENSE file for more info.
