Pod::Spec.new do |s|
  s.name         = "FXHttpEngine"
  s.version      = "1.0.1"
  s.summary      = "http引擎"

  s.homepage     = "https://github.com/zqw87699/FXHttpEngine"

  s.license      = { :type => "MIT", :file => "LICENSE" }

  s.author       = {"zhangdazong" => "929013100@qq.com"}

  s.source       = { :git => "https://github.com/zqw87699/FXHttpEngine.git", :tag => "#{s.version}"}

  s.platform     = :ios, "7.0"

  s.frameworks = "Foundation", "UIKit"

  s.module_name = 'FXHttpEngine' 

  s.requires_arc = true

  s.source_files = 'Classes/*'
  s.public_header_files = 'Classes/*.h'

s.subspec 'API' do |api|
    api.source_files = 'Classes/API/*'
    api.public_header_files = 'Classes/API/*.h'

end

  s.dependency "FXLog"
  s.dependency "FXUtils"
  s.dependency "ReactiveObjC", '2.1.2'
  s.dependency "AFNetworking", '3.1.0'

end
