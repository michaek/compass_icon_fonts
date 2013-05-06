require 'bundler/setup'
require 'compass_icon_fonts'

def render_sass(value, options={})
  options = {
    :style => :compressed,
    :load_paths => [
      File.expand_path('frameworks/compass/stylesheets', Compass.base_directory),
      File.expand_path('stylesheets', CompassIconFonts.base_directory),
      File.expand_path('spec/stylesheets', CompassIconFonts.base_directory),
    ]
  }.merge(options)

  Sass::Engine.new(value, options).render
end

def render_scss(value, options={})
  options = {
    :syntax => :scss
  }.merge(options)

  render_sass value, options
end
