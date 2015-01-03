require 'spec_helper'

describe "TextMarker::Tag.new" do
  before(:each) do
    @instance_default = TextMarker::Tag.new
  end

  it 'Shoud create a Tag object' do
    expect(@instance_default).to be_a TextMarker::Tag
    expect(@instance_default.tag).to eq :span
    expect(@instance_default.open_tag).to eq "<span style='background_color: yellow; color: black'>"
    expect(@instance_default.close_tag).to eq "</span>"
    expect(@instance_default.background_color).to eq :yellow
    expect(@instance_default.text_color).to eq :black
  end
end
