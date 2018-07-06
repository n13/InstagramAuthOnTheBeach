#
# Be sure to run `pod lib lint InstagramAuthOnTheBeach.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
    s.name             = 'InstagramAuthOnTheBeach'
    s.version          = '0.1.0'
    s.summary          = 'The simlpe yet precise way to authenticate with Instagram'
    s.swift_version    = '4.0'
    
    # This description is used to generate tags and improve search results.
    #   * Think: What does it do? Why did you write it? What is the focus?
    #   * Try to keep it short, snappy and to the point.
    #   * Write the description between the DESC delimiters below.
    #   * Finally, don't worry about the indent, CocoaPods strips it!
    
    s.description      = <<-DESC
    There are more elaborate frameworks for accessing the Instagram API out there. But none of them worked for me, and lots of code was required to make them work. This is the Pod I would have liked to use. It authenticates with instagram reliably, all you have to do is show the included view controller and you get back an authentication token. As simple as possible, but not simpler. Yeah I wrote this on the beach.
        DESC
        
        s.homepage         = 'https://github.com/n13/InstagramAuthOnTheBeach'
        # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
        s.license          = { :type => 'MIT', :file => 'LICENSE' }
        s.author           = { 'n13' => 'nheger@gmail.com' }
        s.source           = { :git => 'https://github.com/n13/InstagramAuthOnTheBeach.git', :tag => s.version.to_s }
        #s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'
        
        s.ios.deployment_target = '9.0'
        
        s.source_files = 'Classes/**/*'
        
        # s.resource_bundles = {
        #   'InstagramAuthOnTheBeach' => ['InstagramAuthOnTheBeach/Assets/*.png']
        # }
        
        # s.public_header_files = 'Pod/Classes/**/*.h'
        # s.frameworks = 'UIKit', 'MapKit'
        # s.dependency 'AFNetworking', '~> 2.3'
    end
