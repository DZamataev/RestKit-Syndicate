Pod::Spec.new do |s|
  s.name         = "RestKit-Syndicate"
  s.version      = "0.1.0"
  s.summary      = "iOS RSS feed parsing library running on top of RestKit framework with main goal of storing feeds in Core Data"
  s.homepage     = "https://github.com/DZamataev/RestKit-Syndicate"
  s.license      = { :type => 'MIT', :file => 'LICENSE'}
  s.author       = { "Denis Zamataev" => "denis.zamataev@gmail.com" }
  
  s.source       = {
      :git => "https://github.com/DZamataev/RestKit-Syndicate.git",
      :tag => s.version.to_s
    }
	
  s.ios.deployment_target = '7.0'
    
  s.default_subspec = 'Core'

  s.subspec 'Core' do |c|
    c.requires_arc = true
    c.source_files = 'RestKit-Syndicate/Source/*'
    c.resources = 'RestKit-Syndicate/Resources/*'
	c.dependency 'RestKit'
  end

  s.subspec 'Demo' do |d|
    d.requires_arc = true
    d.source_files = 'Demo/Source/*'
    d.resources = 'Demo/Resources/*'
    d.preserve_paths = "RestKit-Syndicate.xcodeproj", "Podfile"
    d.dependency 'RestKit-Syndicate/Core'
  end

end