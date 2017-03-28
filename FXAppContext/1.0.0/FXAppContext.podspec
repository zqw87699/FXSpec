Pod::Spec.new do |s|
  s.name         = "FXAppContext"
  s.version      = "1.0.0"
  s.summary      = "FX启动配置框架"

  s.homepage     = "https://github.com/zqw87699/FXAppContext"

  s.license      = { :type => "MIT", :file => "LICENSE" }

  s.author       = {"zhangdazong" => "929013100@qq.com"}

  s.source       = { :git => "https://github.com/zqw87699/FXAppContext.git", :tag => "#{s.version}"}

  s.platform     = :ios, "7.0"

  s.frameworks = "Foundation", "UIKit"

  s.module_name = 'FXAppContext' 

  s.requires_arc = true

  s.resources = 'Classes/Resources/FXBannerView.xib'

  s.source_files = 'Classes/*'
  s.public_header_files = 'Classes/*.h'

  s.dependency 'ReactiveObjC', '2.1.2'
  s.dependency "FXCommon/Core" 
  s.dependency "FXLog" 
  s.dependency 'Reachability', '3.2'

end
