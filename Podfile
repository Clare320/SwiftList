# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

flutter_application_path = '../swiftlist_flutter'
load File.join(flutter_application_path, '.ios', 'Flutter', 'podhelper.rb')

target 'SwiftList' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  install_all_flutter_pods(flutter_application_path)
  
  # Pods for SwiftList
  pod 'RxSwift', '6.1.0'
  pod 'RxCocoa', '6.1.0'
  pod 'Moya'
  pod 'Kingfisher'
  pod 'NVActivityIndicatorView'
end
