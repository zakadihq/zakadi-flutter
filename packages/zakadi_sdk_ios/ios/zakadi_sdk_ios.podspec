#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint zakadi_sdk_ios.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'zakadi_sdk_ios'
  s.version          = '0.0.0'
  s.summary          = 'iOS implementation of zakadi_sdk, the Flutter plugin that wraps the native Zakadi face-liveness SDKs.'
  s.description      = <<-DESC
iOS implementation of zakadi_sdk, the Flutter plugin that wraps the native Zakadi face-liveness SDKs.
                       DESC
  s.homepage         = 'https://github.com/zakadihq/zakadi-flutter'
  s.license          = { :file => '../LICENSE' }
  s.author           = 'Zakadi'
  s.source           = { :path => '.' }
  s.source_files = 'zakadi_sdk_ios/Sources/zakadi_sdk_ios/**/*.swift'
  s.dependency 'Flutter'
  s.platform = :ios, '15.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'

  s.resource_bundles = {'zakadi_sdk_ios_privacy' => ['zakadi_sdk_ios/Sources/zakadi_sdk_ios/PrivacyInfo.xcprivacy']}
end
