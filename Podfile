platform :ios, '8.0'
use_frameworks!

target 'StudyChemistry' do
    # Layout Equaltion
    pod 'iosMath'
    
    # Alamofire (Networking)
    pod 'Alamofire'
    
    # AlamofireImage - Image Fetcher
    pod 'AlamofireImage'
    
    # ObjectMapper - auto mapper data
    pod 'ObjectMapper'
    pod 'SwiftyJSON'
    
    # Crashlytics (Crash & Tracking)
    pod 'Crashlytics'
    
end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['SWIFT_VERSION'] = '3.0'
        end
    end
end
