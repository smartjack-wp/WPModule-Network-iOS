Pod::Spec.new do |s|
  s.name = 'WPModuleNetwork'
  s.version = '0.4.0'
  s.summary = 'SmartJack iOS Network Module'
  s.description = 'WPNetworkModule is Network Module for iOS.'
  s.homepage = 'https://github.com/smartjack-wp/WPModule-Network-iOS'
  s.license = { :type => 'MIT', :file => 'LICENSE' }
  s.author = { 'onemoon(SmartJack.Ltd)' => 'onemoonstudio@gmail.com' }
  s.source = { :git => 'https://github.com/smartjack-wp/WPModule-Network-iOS.git', :tag => s.version.to_s }
  s.ios.deployment_target = '11.0'
  s.source_files = 'WPModuleNetwork/Classes/**/*'
  s.swift_version = '5.0'
  s.dependency 'Moya', '~> 13.0.0'
end
