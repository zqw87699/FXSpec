Pod::Spec.new do |s|
  s.name         = "FXAppContextSwift"
  s.version      = "1.0.3"
  s.summary      = "FX启动配置框架"

  s.homepage     = "https://github.com/zqw87699/FXAppContextSwift"

  s.license      = { :type => "MIT", :file => "LICENSE" }

  s.author       = {"zhangdazong" => "929013100@qq.com"}

  s.source       = { :git => "https://github.com/zqw87699/FXAppContextSwift.git", :tag => "#{s.version}"}

  s.platform     = :ios, "7.0"

  s.frameworks = "Foundation", "UIKit"

  s.module_name = 'FXAppContextSwift'

  s.requires_arc = true

s.subspec 'Core' do |core|
    core.source_files = 'Classes/Core/*.{swift}'
    core.dependency 'FXAppContextSwift/API'
    core.dependency 'ReactiveCocoa', '5.0.0'
    core.dependency 'ReachabilitySwift', '3'
end

s.subspec 'API' do |api|
    api.source_files = 'Classes/API/*.{swift}'
end

end
