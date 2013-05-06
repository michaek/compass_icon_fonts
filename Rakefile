require 'rake'
require 'rspec/core/rake_task'
require 'compass_icon_fonts'

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

task :build do
  require 'compass_icon_fonts/fonts'

  require 'webmock'
  include WebMock::API
  require 'vcr'
  require 'nokogiri'

  VCR.configure do |c|
    c.cassette_library_dir = 'http_cache'
    c.hook_into :webmock # or :fakeweb
  end

  puts 'Capturing and regenerating font characters.'

  VCR.use_cassette('characters', :allow_playback_repeats => true) do
    CompassIconFonts::Fonts.build
  end

end