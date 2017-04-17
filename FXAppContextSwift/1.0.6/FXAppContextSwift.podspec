Pod::Spec.new do |s|
  s.name         = "FXAppContextSwift"
  s.version      = "1.0.6"
  s.summary      = "FX启动配置框架"

  s.homepage     = "https://github.com/zqw87699/FXAppContextSwift"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = {"zhangdazong" => "929013100@qq.com"}

  s.ios.deployment_target = "8.0"

  s.source       = { :git => "https://github.com/zqw87699/FXAppContextSwift.git", :tag => "#{s.version}" }
  
  s.source_files  = "Classes/*.{swift}"
  s.dependency 'Result', '~> 3.2'
  s.dependency 'ReactiveCocoa', '5.0.2'
  s.dependency 'ReachabilitySwift', '3'

  s.pod_target_xcconfig = {"OTHER_SWIFT_FLAGS[config=Release]" => "-suppress-warnings" }

end
