platform :ios, '7.0'

workspace 'iEducation.xcworkspace'

project 'Teacher/Teacher.xcodeproj'
project 'CommonKit/CommonKit.xcodeproj'
project 'DataKit/DataKit.xcodeproj'

target 'Teacher' do
    platform :ios, '7.0'
    #    pod 'ZLFramework', :path => '/Users/doit/Desktop/ZLFramework'
    project 'Teacher/Teacher.xcodeproj'
    pod 'CocoaHTTPServer'
    #${SRCROOT}/CommonKit
    pod 'CommonKit', :path => 'CommonKit'
    pod 'DataKit', :path => 'DataKit'
    
    #pod 'ProtoBuffer'
end


target 'DataKit' do
    platform :ios, '7.0'
    project 'DataKit/DataKit.xcodeproj'
    pod 'AFNetworking', "~> 3.1.0"
    pod 'CommonKit', :path => 'CommonKit'
    
end



target 'CommonKit' do
    platform :ios, '7.0'
    project 'CommonKit/CommonKit.xcodeproj'
    #    pod 'AFNetworking', "~> 3.0"
    #pod 'RNCryptor', "~> 3.0.1"
    pod 'HTMLReader'
    pod 'FCModel'
    pod 'CocoaLumberjack'
    pod 'ProtocolBuffers'
    pod 'CocoaAsyncSocket'
    pod 'DTFoundation'
end