#
# Be sure to run `pod lib lint HGPhotos_swift.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#
# git tag '0.1.0'
# git push --tags
# pod lib lint HGCommens.podspec --allow-warnings
# pod repo push HGCommens HGCommens.podspec

Pod::Spec.new do |s|
  s.name             = 'HGCommens'
  s.version          = '1.0.2'
  s.summary          = '一些工具'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = '一些实用工具'
  s.swift_version = '5.0'
  s.homepage         = 'https://github.com/HGMyway/HGCommens'
#  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'ismyway7@sina.com' => '616834641@qq.com' }
  s.source           = { :git => 'https://github.com/HGMyway/HGCommens.git', :tag => s.version.to_s }
  s.ios.deployment_target = '10.0'

  s.source_files = 'HGCommens/**/*'
  
  # s.resource_bundles = {
  #   'HGPhotos_swift' => ['HGPhotos_swift/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
   # s.frameworks = 'Photos'
   s.dependency 'SnapKit', '~> 5.0.1'
end
