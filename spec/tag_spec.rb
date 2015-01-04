require 'spec_helper'

describe "TextMarker::Tag.new" do
  before(:each) do
    @instance_default = TextMarker::Tag.new
    @instance = TextMarker::Tag.new :h1, :black, :white
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
end
