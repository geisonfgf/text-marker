require 'spec_helper'

describe "TextMarker::Tag" do
  before(:each) do
    @instance_default = TextMarker::Tag.new
    @instance = TextMarker::Tag.new :h1, :black, :white
    @exception_error_message_for_tag = ":tag must be one of these html tags "\
                                      ":h1, :h2, :h3, :h4, :h5, :h6, :span, :div, "\
                                      ":p, :a, :button, :center, :strong, :u, :b, :i"
    @exception_error_message_for_color = "The color must be a css color value like #ffffff or one of these standard colors "\
                                        ":aqua, :black, :blue, :fuchsia, :gray, :green, :lime, :maroon, :navy, :olive, "\
                                        ":orange, :purple, :red, :silver, :teal, :white, :yellow"
  end

  it 'Shoud create a Default Tag object' do
    expect(@instance_default).to be_a TextMarker::Tag
    expect(@instance_default.tag).to eq :span
    expect(@instance_default.open_tag).to eq "<span style='background_color: yellow; color: black;'>"
    expect(@instance_default.close_tag).to eq "</span>"
    expect(@instance_default.background_color).to eq :yellow
    expect(@instance_default.text_color).to eq :black
    expect(@instance_default.to_s).to eq "<span style='background_color: yellow; color: black;'></span>"
  end

  it 'Shoud create a Tag object' do
    expect(@instance).to be_a TextMarker::Tag
    expect(@instance.tag).to eq :h1
    expect(@instance.open_tag).to eq "<h1 style='background_color: black; color: white;'>"
    expect(@instance.close_tag).to eq "</h1>"
    expect(@instance.background_color).to eq :black
    expect(@instance.text_color).to eq :white
    expect(@instance.to_s).to eq "<h1 style='background_color: black; color: white;'></h1>"
  end

  it 'Should raise a ArgumentException creating Tag' do
    expect { TextMarker::Tag.new :error }.to raise_error(ArgumentError, @exception_error_message_for_tag)
    expect { TextMarker::Tag.new :span, :error }.to raise_error(ArgumentError, @exception_error_message_for_color)
    expect { TextMarker::Tag.new :span, :white, :error }.to raise_error(ArgumentError, @exception_error_message_for_color)
  end

  it 'Should set tag to :h3' do
    expect(@instance_default.tag).to eq :span
    @instance_default.tag = :h3
    expect(@instance_default.tag).to eq :h3
  end

  it 'Should set background_color to :black' do
    expect(@instance_default.background_color).to eq :yellow
    @instance_default.background_color = :black
    expect(@instance_default.background_color).to eq :black
  end

  it 'Should set background_color to #000000' do
    expect(@instance_default.background_color).to eq :yellow
    @instance_default.background_color = '#000000'
    expect(@instance_default.background_color).to eq '#000000'
  end

  it 'Should set text_color to :white' do
    expect(@instance_default.text_color).to eq :black
    @instance_default.text_color = :white
    expect(@instance_default.text_color).to eq :white
  end

  it 'Should set background_color to #ffffff' do
    expect(@instance_default.text_color).to eq :black
    @instance_default.text_color = '#ffffff'
    expect(@instance_default.text_color).to eq '#ffffff'
  end

  it 'Should raise a ArgumentException setting Tag tag' do
    expect { @instance_default.tag = :error }.to raise_error(ArgumentError, @exception_error_message_for_tag)
  end

  it 'Should raise a ArgumentException setting Tag background_color' do
    expect { @instance_default.background_color = :error }.to raise_error(ArgumentError, @exception_error_message_for_color)
  end

  it 'Should raise a ArgumentException setting Tag text_color' do
    expect { @instance_default.text_color = :error }.to raise_error(ArgumentError, @exception_error_message_for_color)
  end
end
