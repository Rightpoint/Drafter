#
# Be sure to run `pod lib lint Drafter.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "Drafter"
  s.version          = "0.1.0"
  s.summary          = "A short description of Drafter."
  s.description      = <<-DESC
                       An optional longer description of Drafter

                       * Markdown format.
                       * Don't worry about the indent, we strip it!
                       DESC
  s.homepage         = "https://github.com/raizlabs/Drafter"
  s.license          = 'MIT'
  s.author           = { "Derek Ostrander" => "derek.ostrander@raizlabs.com", "Matt Buckley" => "matt.buckley@raizlabs.com" }
  s.source           = { :git => "https://github.com/<GITHUB_USERNAME>/Drafter.git", :tag => s.version.to_s }
   s.social_media_url = 'https://twitter.com/raizlabs'

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'Drafter' => ['Pod/Assets/*.png']
  }

end

