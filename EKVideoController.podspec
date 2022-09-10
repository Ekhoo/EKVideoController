Pod::Spec.new do |s|
  s.name         = "EKVideoController"
  s.version      = "0.0.1"
  s.summary      = "Light weight view controller which add a video as a full screen background for IOS written in Objective-C"
  s.homepage     = "https://github.com/Ekhoo"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "Lucas Ortis" => "contact@lucas-ortis.com" }
  s.platform     = :ios, "6.0"
  s.source       = { :git => "https://github.com/Ekhoo/EKVideoController.git", :tag => "0.0.1" }
  s.source_files = "EKVideoController/*.{h,m}"
  s.requires_arc = true
end
