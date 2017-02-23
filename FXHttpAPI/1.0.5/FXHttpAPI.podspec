Pod::Spec.new do |s|
  s.name         = "FXHttpAPI"
  s.version      = "1.0.5"
  s.summary      = "网络请求框架"

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

s.subspec 'Core' do |core|
    core.source_files = 'Classes/Core/*'
    core.public_header_files = 'Classes/Core/*.h'

    core.dependency 'FXHttpAPI/API’
    core.dependency 'FXCommon/Core'
    core.dependency 'FXCommon/Utiles'
    core.dependency 'ReactiveObjC', '2.1.2'
    core.dependency 'AFNetworking', '3.1.0'

end

s.subspec 'API' do |api|
    api.source_files = 'Classes/API/*'
    api.public_header_files = 'Classes/API/*.h'
end

  s.dependency "FXLog"

end
