Pod::Spec.new do |s|
  s.name         = "FXLog"
  s.version      = "1.0.2"
  s.summary      = "日志框架"

  s.homepage     = "https://github.com/zqw87699/FXLog"

  s.license      = { :type => "MIT", :file => "LICENSE" }

  s.author       = {"zhangdazong" => "929013100@qq.com"}

  s.source       = { :git => "https://github.com/zqw87699/FXLog.git", :tag => "#{s.version}"}

  s.platform     = :ios, "7.0"

  s.source_files  = "Classes/*.{h,m}"

  s.public_header_files = "Classes/*.h"

  s.frameworks = "Foundation", "UIKit"

  s.module_name = 'FX' 

  s.requires_arc = true

  s.dependency "CocoaLumberjack", "~> 2.2.0"

end
