Pod::Spec.new do |s|
  s.name         = "FXUtils"
  s.version      = “1.0.0"
  s.summary      = "FX工具类"

  s.homepage     = "https://github.com/zqw87699/FXUtils"

  s.license      = { :type => "MIT", :file => "LICENSE" }

  s.author       = {"zhangdazong" => "929013100@qq.com"}

  s.source       = { :git => "https://github.com/zqw87699/FXUtils.git", :tag => "#{s.version}"}

  s.platform     = :ios, "7.0"

s.subspec 'Utils' do |utils|
    utils.source_files = 'Classes/Utils/*'
    utils.public_header_files = 'Classes/Utils/*.h'

end

s.subspec 'Extension' do |extension|
    core.source_files = 'Classes/Extension/*'
    core.public_header_files = 'Classes/Extension/*.h'
end


  s.frameworks = "Foundation", "UIKit"

  s.module_name = 'FXUtils'

  s.requires_arc = true

end
