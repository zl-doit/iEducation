platform :ios, '7.0'

workspace 'iEducation.xcworkspace'

project 'Teacher/Teacher.xcodeproj'
project 'CommonFoundation/CommonFoundation.xcodeproj'
project 'DataFoundation/DataFoundation.xcodeproj'

target 'Teacher' do
  platform :ios, '7.0'
  project 'Teacher/Teacher.xcodeproj'
  pod 'AFNetworking', "~> 3.0"
  #pod 'ProtoBuffer'
end

 
target 'DataFoundation' do
  platform :ios, '7.0'
  project 'DataFoundation/DataFoundation.xcodeproj'
end

target 'CommonFoundation' do
  platform :ios, '7.0'
  project 'CommonFoundation/CommonFoundation.xcodeproj'
  pod 'AFNetworking', "~> 3.0"
  pod 'RNCryptor', "~> 3.0.1"
  pod 'HTMLReader'
  pod 'FCModel', "~> 0.9.0"
  pod 'CocoaLumberjack', "~> 2.0.0"
  pod 'ProtocolBuffers', "~> 1.9.9.2"
  pod 'CocoaAsyncSocket'
end