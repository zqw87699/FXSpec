Pod::Spec.new do |s|
  s.name         = "FXLogSwift"
  s.version      = "1.0.0"
  s.summary      = "基于CocoaLumberjack的日志管理框架"

  s.homepage     = "https://github.com/zqw87699/FXLogSwift"

  s.license      = { :type => "MIT", :file => "LICENSE" }

  s.author       = {"zhangdazong" => "929013100@qq.com"}

  s.source       = { :git => "https://github.com/zqw87699/FXLogSwift.git", :tag => "#{s.version}"}

  s.platform     = :ios, "8.0"

  s.frameworks = "Foundation", "UIKit"

  s.module_name = 'FXLogSwift'

  s.requires_arc = true

  s.dependency 'CocoaLumberjack', '3.1.0'

  s.dependency 'FXAppContextSwift'

end
