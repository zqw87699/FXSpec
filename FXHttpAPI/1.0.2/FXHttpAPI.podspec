Pod::Spec.new do |s|
  s.name         = "FXHttpAPI"
  s.version      = "1.0.2"
  s.summary      = "日志框架"

  s.homepage     = "https://github.com/zqw87699/FXHttpAPI"

  s.license      = { :type => "MIT", :file => "LICENSE" }

  s.author       = {"zhangdazong" => "929013100@qq.com"}

  s.source       = { :git => "https://github.com/zqw87699/FXHttpAPI.git", :tag => "#{s.version}"}

  s.platform     = :ios, "7.0"

  s.source_files  = "Classes/*.{h,m}"

  s.public_header_files = "Classes/*.h"

  s.frameworks = "Foundation", "UIKit"

  s.module_name = 'FXHttpAPI' 

  s.requires_arc = true

  s.dependency "FXLog"
  s.dependency "FXCommon"
  s.dependency "ReactiveObjC", "~> 2.1.2"
  s.dependency "AFNetworking", "~> 3.1.0"

end
