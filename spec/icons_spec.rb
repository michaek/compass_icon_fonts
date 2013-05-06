require 'spec_helper.rb'

describe 'Icons' do
  it 'should render compass font for testing' do
    render_scss("@import 'test';\n@import 'icon-fonts/entypo';\n@import 'icon-fonts/entypo-social';").should == ".face{@font-face{font-family:\"face\";src:url('//fonts/face.ttf') format('truetype'), url('//fonts/face.otf') format('opentype')}}\n"
  end
end