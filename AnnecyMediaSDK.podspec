Pod::Spec.new do |s|

s.platform = :ios
s.ios.deployment_target = '8.0'
s.name = "AnnecyMediaSDK"
s.version = "0.0.1"
s.summary = "Create your custom offerwalls with Annecy Media."
s.description = "Create your custom offerwalls with Annecy Media."
s.homepage = "https://www.annecy.media"
s.license = "2018 GD Mobile GmbH"
s.author = "schultka"
s.source = { :git => "https://github.com/gdmobile/annecy-media-ios-sdk.git", :tag => "#{s.version}" }
s.frameworks = ['Foundation', 'UIKit', 'AdSupport']
s.source_files = "AnnecyMediaSDK/AnnecyMediaSDK/**/*.{swift,h,m}"
s.public_header_files = "AnnecyMediaSDK/AnnecyMediaSDK/**/*.h"
s.pod_target_xcconfig = { 'SWIFT_VERSION' => '4' }

end
