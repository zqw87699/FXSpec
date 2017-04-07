Pod::Spec.new do |s|
  s.name         = "FXAppContextSwift"
  s.version      = "1.0.1"
  s.summary      = "FX启动配置框架"

  s.homepage     = "https://github.com/zqw87699/FXAppContextSwift"

  s.license      = { :type => "MIT", :file => "LICENSE" }

  s.author       = {"zhangdazong" => "929013100@qq.com"}

  s.source       = { :git => "https://github.com/zqw87699/FXAppContextSwift.git", :tag => "#{s.version}"}

  s.platform     = :ios, "7.0"

  s.frameworks = "Foundation", "UIKit"

  s.module_name = 'FXAppContextSwift'

  s.requires_arc = true

  s.source_files = 'Classes/*'
  s.public_header_files = 'Classes/*.h'

s.subspec 'API' do |api|
    api.source_files = 'Classes/API/*'
    api.public_header_files = 'Classes/API/*.h'
end

  s.dependency 'ReactiveCocoa', '5.0.0'
  s.dependency 'ReachabilitySwift', '3'

end
