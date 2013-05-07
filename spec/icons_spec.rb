require 'spec_helper.rb'

describe 'Icons' do

  it 'should render compass font for testing' do
    render_scss("@import 'smoke_test';").should == "@font-face{font-family:\"Entypo\";src:url('//fonts/entypo.eot') format('embedded-opentype'), url('//fonts/entypo.woff') format('woff'), url('//fonts/entypo.ttf') format('truetype'), url('//fonts/entypo.svg') format('svg')}\n"
  end

  it 'should render a complete icon set' do
    count = 238
    render_scss("@import 'icon-fonts/entypo'; @include compass-icon-fonts-family; @include compass-icon-fonts-set;").scan(/\.entypo-[^:]+:before/).size.should == count * 3
  end

  it 'should render a partial icon set' do
    count = 3
    render_scss("@import 'icon-fonts/entypo'; @include compass-icon-fonts-family; @include compass-icon-fonts-set(volume sound mute);").scan(/\.entypo-[^:]+:before/).size.should == count * 3
  end

  it 'should render an icon set with custom prefix' do
    count = 3
    render_scss("@import 'icon-fonts/entypo'; @include compass-icon-fonts-family; @include compass-icon-fonts-set(volume sound mute, icon);").scan(/\.icon-[^:]+:before/).size.should == count * 3
  end

  it 'should only render append optionally' do
    count = 3
    render_scss("@import 'icon-fonts/entypo'; @include compass-icon-fonts-family; @include compass-icon-fonts-set(volume sound mute, icon);").scan(/\.icon-[^:]+:after/).size.should == 0
    render_scss("@import 'icon-fonts/entypo'; @include compass-icon-fonts-family; @include compass-icon-fonts-set(volume sound mute, icon, true);").scan(/\.icon-[^:]+:after/).size.should == count * 3
  end

end