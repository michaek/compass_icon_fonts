module CompassIconFonts::Fonts
  class Entypo < BaseFont
    def source_uri
      'http://www.entypo.com/'
    end

    def fonts
      %w(entypo)
    end

    def pairs
      characters = {}
      dom.css('#characters ul:first li').each do |item|
        characters[item[:title]] = item.content
      end
      characters
    end
  end
end