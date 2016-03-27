#
#  Be sure to run `pod spec lint MMTransitionAnimator.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|
  s.name         = 'FastImageCache'
  s.version      = '1.5.1'
  s.license      = { :type => 'MIT',
                      :text => 'copyright' }
  s.homepage	   = 'https://github.com/mojun/MMTransitionAnimator'
  s.authors      = { 'mojun' => 'immojun@gmail.com' }
  s.summary      = 'iOS library for quickly displaying images while scrolling.'
  s.source       = { :git => 'https://github.com/mojun/FastImageCache.git' }
  s.source_files = 'FastImageCache','FastImageCache/FastImageCache/**/*.{h,m}'
  s.requires_arc = true
  s.platform     = :ios, '6.0'
  
end
