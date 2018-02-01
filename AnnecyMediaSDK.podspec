Pod::Spec.new do |s|

s.platform = :ios
s.ios.deployment_target = '8.0'
s.name = "AnnecyMediaSDK"
s.version = "0.0.4"
s.summary = "Create your custom offerwalls with Annecy Media."
s.description = "Annecy Media is an offerwall mediation tool. Create a custom offerwall for your app!"
s.homepage = "https://www.annecy.media"
s.license = { :type => "MIT", :file => "LICENSE" }
s.author = "schultka"
s.source = { :git => "https://github.com/gdmobile/annecy-media-ios-sdk.git", :tag => "#{s.version}" }
s.frameworks = ['Foundation', 'UIKit', 'AdSupport']
s.source_files = "AnnecyMediaSDK/AnnecyMediaSDK/**/*.{swift,h,m}"
s.public_header_files = "AnnecyMediaSDK/AnnecyMediaSDK/**/*.h"
s.pod_target_xcconfig = { 'SWIFT_VERSION' => '4' }

end
