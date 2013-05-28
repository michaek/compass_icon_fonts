require 'active_support/inflector'

module CompassIconFonts::Fonts
  def self.build
    # TODO: Detect subclasses.
    [Entypo, EntypoSocial].each do |font_class|
      font = font_class.new
      font.build
    end
  end

  class BaseFont
    def name
      self.class.name.split('::').last
    end

    def fonts
      []
    end

    def extensions
      %w(eot woff ttf svg)
    end

    def size
      '1.25em'
    end

    def source_uri
      ''
    end

    def fetch
      @raw_response = Net::HTTP.get_response(URI(source_uri))
      @raw_response.body
    end

    def text
      fetch
    end

    def dom
      Nokogiri::HTML(fetch)
    end

    def pairs
      {}
    end

    def build
      dashed_name = ActiveSupport::Inflector.dasherize(ActiveSupport::Inflector.underscore(name))
      template = 'lib/compass_icon_fonts/templates/font.scss.erb'
      destination = 'stylesheets/compass-icon-fonts/%s.scss' % dashed_name
      erb = ERB.new(File.read(File.expand_path(template, CompassIconFonts.base_directory)))

      locals = { name: name, variable: dashed_name, pairs: pairs, size: size, files: fonts.product(extensions.reject{|ext| ext == 'eot'}).map{|file| file.join '.' } }
      scss = erb.result(OpenStruct.new(locals).instance_eval{ binding })

      File.write(File.expand_path(destination, CompassIconFonts.base_directory), scss)
    end
  end
end

require 'compass_icon_fonts/fonts/entypo'
require 'compass_icon_fonts/fonts/entypo_social'