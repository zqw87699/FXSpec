Pod::Spec.new do |s|
  s.name         = "FXStorage"
  s.version      = "1.0.1"
  s.summary      = "FX存储框架"

  s.homepage     = "https://github.com/zqw87699/FXStorage"

  s.license      = { :type => "MIT", :file => "LICENSE" }

  s.author       = {"zhangdazong" => "929013100@qq.com"}

  s.source       = { :git => "https://github.com/zqw87699/FXStorage.git", :tag => "#{s.version}"}

  s.platform     = :ios, "7.0"

  s.frameworks = "Foundation", "UIKit"

  s.module_name = 'FXStorage' 

  s.requires_arc = true

  s.source_files = 'Classes/*'
  s.public_header_files = 'Classes/*.h'

  s.dependency 'FXLog'
  s.dependency 'FXCommon/Core'
  s.dependency 'UICKeyChainStore', '2.1.0'

end
