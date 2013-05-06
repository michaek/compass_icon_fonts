require 'compass'

module CompassIconFonts
  def self.base_directory
    File.expand_path('../..', __FILE__)
  end
end

Compass::Frameworks.register 'compass_icon_fonts', :path => CompassIconFonts.base_directory