#
# Be sure to run `pod lib lint TailoredSwiftAutoLayoutHelpers.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "TailoredSwiftAutoLayoutHelpers"
  s.version          = "0.1.0"
  s.summary          = "A short description of TailoredSwiftAutoLayoutHelpers."
  s.description      = <<-DESC
                       An optional longer description of TailoredSwiftAutoLayoutHelpers

                       * Markdown format.
                       * Don't worry about the indent, we strip it!
                       DESC
  s.homepage         = "https://github.com/raizlabs/TailoredSwiftAutoLayoutHelpers"
  s.license          = 'MIT'
  s.author           = { "Derek Ostrander" => "derek.ostrander@raizlabs.com", "Matt Buckley" => "matt.buckley@raizlabs.com" }
  s.source           = { :git => "https://github.com/<GITHUB_USERNAME>/TailoredSwiftAutoLayoutHelpers.git", :tag => s.version.to_s }
   s.social_media_url = 'https://twitter.com/raizlabs'

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'TailoredSwiftAutoLayoutHelpers' => ['Pod/Assets/*.png']
  }

end

