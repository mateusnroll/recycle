#
#  Be sure to run `pod spec lint Recycle.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "Recycle"
  s.version      = "0.0.2"
  s.summary      = "A swift 3 library to help recycling iOS views and cells."
  s.description  = "The library helps you recycle views for one or more controllers, and avoids unecessary code duplication and verbosity."

  s.homepage     = "https://github.com/mateusnroll/recycle"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "Mateus Pinheiro" => "mateus.pinheiro@gmail.com" }
  s.social_media_url = "http://twitter.com/mateusnroll"

  s.platform     = :ios, "9.0"
  s.source       = { :git => "https://github.com/mateusnroll/recycle.git", :tag => "v#{s.version}" }

  s.source_files  = "Recycle", "Recycle/**/*.{h,m,swift}"
  s.exclude_files = "Classes/Exclude"

  s.pod_target_xcconfig = { 'SWIFT_VERSION' => '3' }

end
