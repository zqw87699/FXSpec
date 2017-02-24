Pod::Spec.new do |s|
  s.name         = "FXRoutableAPI"
  s.version      = "1.0.0"
  s.summary      = "FX路由协议"

  s.homepage     = "https://github.com/zqw87699/FXRoutableAPI"

  s.license      = { :type => "MIT", :file => "LICENSE" }

  s.author       = {"zhangdazong" => "929013100@qq.com"}

  s.source       = { :git => "https://github.com/zqw87699/FXRoutableAPI.git", :tag => "#{s.version}"}

  s.platform     = :ios, "7.0"

  s.frameworks = "Foundation", "UIKit"

  s.module_name = 'FXRoutableAPI' 

  s.requires_arc = true

  s.source_files = 'Classes/*'
  s.public_header_files = 'Classes/*.h'

  s.dependency "FXLog"

end
