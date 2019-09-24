source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '12.0'
use_frameworks!

project 'Modularizing'
workspace 'Modularizing.xcworkspace'

def dev_pods
    pod 'SnapKit', '~> 4.0.0'
end

target 'Modularizing' do
    dev_pods
end

target 'Core'do

    project 'Core/Core.xcodeproj'

end

target 'Login'do

    project 'Login/Login.xcodeproj'

    dev_pods
end

target 'Onboarding'do

    project 'Onboarding/Onboarding.xcodeproj'

    dev_pods
end

target 'Dashboard'do

    project 'Dashboard/Dashboard.xcodeproj'

    dev_pods
end
