Pod::Spec.new do |s|
  s.name         = "GNBindings"
  s.version      = "0.0.7"
  s.summary      = "GNBindings inspired by cocoa bindings ."
  s.description  = <<-DESC
  					Programatically create bindings between multiple objects/keys.
                   DESC
  s.homepage     = "https://github.com/jakubknejzlik/GNBindings"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "Jakub Knejzlik" => "jakub.knejzlik@gmail.com" }
  s.platform     = :ios, "6.0"
  s.source       = { :git => "https://github.com/jakubknejzlik/GNBindings.git", :tag => s.version.to_s }
  s.source_files  = "GNBindings/*.{h,m}"
  s.framework  = "UIKit"
  s.requires_arc = true
end
