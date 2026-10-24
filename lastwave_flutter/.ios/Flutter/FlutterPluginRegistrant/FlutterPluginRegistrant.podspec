#
# Generated file, do not edit.
#

Pod::Spec.new do |s|
  s.name             = 'FlutterPluginRegistrant'
  s.version          = '0.0.1'
  s.summary          = 'Registers plugins with your Flutter app'
  s.description      = <<-DESC
Depends on all your plugins, and provides a function to register them.
                       DESC
  s.homepage         = 'https://flutter.dev'
  s.license          = { :type => 'BSD' }
  s.author           = { 'Flutter Dev Team' => 'flutter-dev@googlegroups.com' }
  s.ios.deployment_target = '15.0'
  s.source_files =  "Classes", "Classes/**/*.{h,m}"
  s.source           = { :path => '.' }
  s.public_header_files = './Classes/**/*.h'
  s.static_framework    = true
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES' }
  s.dependency 'Flutter'
  s.dependency 'audio_service'
  s.dependency 'audio_session'
  s.dependency 'connectivity_plus'
  s.dependency 'device_info_plus'
  s.dependency 'file_picker_darwin'
  s.dependency 'firebase_core'
  s.dependency 'firebase_messaging'
  s.dependency 'flutter_background_service_ios'
  s.dependency 'flutter_downloader'
  s.dependency 'flutter_local_notifications'
  s.dependency 'flutter_secure_storage_darwin'
  s.dependency 'integration_test'
  s.dependency 'just_audio'
  s.dependency 'local_auth_darwin'
  s.dependency 'package_info_plus'
  s.dependency 'permission_handler_apple'
  s.dependency 'share_plus'
  s.dependency 'shared_preferences_foundation'
  s.dependency 'sqflite_darwin'
  s.dependency 'url_launcher_ios'
  s.dependency 'workmanager_apple'
end
