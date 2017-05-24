Pod::Spec.new do |s|
  s.name         = "FXStorageSwift"
  s.version      = "1.0.0"
  s.summary      = "FX存储框架"

  s.homepage     = "https://github.com/zqw87699/FXStorageSwift"

  s.license      = { :type => "MIT", :file => "LICENSE" }

  s.author       = {"zhangdazong" => "929013100@qq.com"}

  s.source       = { :git => "https://github.com/zqw87699/FXStorageSwift.git", :tag => "#{s.version}"}

  s.platform     = :ios, "8.0"

  s.frameworks = "Foundation", "UIKit"

  s.module_name = 'FXStorageSwift'

  s.requires_arc = true

  s.source_files = 'Classes/*.{swift}'

  s.dependency 'KeychainSwift','7.0.0'

end
