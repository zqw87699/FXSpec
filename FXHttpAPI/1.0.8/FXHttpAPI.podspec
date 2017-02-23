Pod::Spec.new do |s|
  s.name         = "FXHttpAPI"
  s.version      = "1.0.8"
  s.summary      = "http请求API"

  s.homepage     = "https://github.com/zqw87699/FXHttpAPI"

  s.license      = { :type => "MIT", :file => "LICENSE" }

  s.author       = {"zhangdazong" => "929013100@qq.com"}

  s.source       = { :git => "https://github.com/zqw87699/FXHttpAPI.git", :tag => "#{s.version}"}

  s.platform     = :ios, "7.0"

  s.frameworks = "Foundation", "UIKit"

  s.module_name = 'FXHttpAPI' 

  s.requires_arc = true

  s.source_files = 'Classes/*'
  s.public_header_files = 'Classes/*.h'

  s.dependency "FXLog"

end
