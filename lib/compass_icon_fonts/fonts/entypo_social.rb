module CompassIconFonts::Fonts
  class EntypoSocial < Entypo
    def fonts
      %w(entypo-social)
    end

    def pairs
      characters = {}
      dom.css('#characters ul#entypo-social li').each do |item|
        characters[item[:title]] = item.content
      end
      characters
    end
  end
end