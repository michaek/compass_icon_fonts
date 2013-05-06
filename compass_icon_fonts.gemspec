# encoding: utf-8

$:.unshift File.expand_path('../lib', __FILE__)
require 'compass_icon_fonts/version'

Gem::Specification.new do |s|
  s.name          = "compass_icon_fonts"
  s.version       = CompassIconFonts::VERSION
  s.authors       = ["Michael Hellein"]
  s.email         = ["themichaek@gmail.com"]
  s.homepage      = "https://github.com/michaek/compass_icon_fonts"
  s.summary       = "Simple helpers for common icon font sets."
  s.description   = "Simple helpers for common icon font sets."

  s.files         = `git ls-files app lib`.split("\n")
  s.platform      = Gem::Platform::RUBY
  s.require_paths = ['lib']
  s.rubyforge_project = '[none]'

  s.add_development_dependency 'rake'
  s.add_development_dependency 'bundler'
  s.add_development_dependency 'rspec', '~> 2.13.0'

  s.add_dependency 'compass', '>= 0.11'
end
