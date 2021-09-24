
Pod::Spec.new do |s|
  s.name         = "WifiView"
  s.version      = "1.0.0"
  s.summary      = "WifiView framework"
  s.description  = <<-DESC
                  WifiView Pod can animate wifi signal strength
                   DESC
  s.homepage     = "https://github.com/jwd-ali/IOS-Portfolio"
  s.license      = "MIT"
  # s.license    = { :type => "MIT", :file => "FILE_LICENSE" }
  s.authors      = { "Jawad Ali" => "L060214@gmail.com" }
  s.platforms    = { :ios => "9.0" }
  s.source       = { :git => "https://github.com/jwd-ali/WifiView.git", :tag => "#{s.version}" }

  s.source_files = "Sources/**/*.{h,m,swift}"
  s.swift_version = "5.0"
end
