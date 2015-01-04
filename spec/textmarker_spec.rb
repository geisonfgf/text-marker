require 'spec_helper'

describe "TextMarker::Marker" do
  before(:each) do
    @instance_tag = TextMarker::Tag.new :h1, :black, :white
    @instance_default = TextMarker::Marker.new
    @instance_with_text = TextMarker::Marker.new "Some text to be marked."
    @instance_with_long_text = TextMarker::Marker.new "Some text to be marked. After used TextMaker in this text it will return this text with desired text marked."
  end

  it 'Shoud create a Marker object with no text' do
    expect(@instance_default).to be_a TextMarker::Marker
    expect(@instance_default.text).to eq ""
  end

  it 'Shoud create a Marker object with text' do
    expect(@instance_with_text).to be_a TextMarker::Marker
    expect(@instance_with_text.text).to eq "Some text to be marked."
  end

  it 'Shoud return the text passed to Marker with the first snippet of desired text marked, passing a default Tag' do
    expect(@instance_with_long_text).to be_a TextMarker::Marker
    expect(@instance_with_long_text.text).to eq "Some text to be marked. After used TextMaker in this text it will return this text with desired text marked."
    expect(@instance_with_long_text.mark_first_ocurrence_of("text")).to eq "Some <span style='background_color: yellow; color: black;'>text</span> to be marked. After used TextMaker in this text it will return this text with desired text marked."
  end

  it 'Shoud return the text passed to Marker with the first snippet of desired text marked, passing a custom Tag' do
    expect(@instance_with_long_text).to be_a TextMarker::Marker
    expect(@instance_with_long_text.text).to eq "Some text to be marked. After used TextMaker in this text it will return this text with desired text marked."
    expect(@instance_with_long_text.mark_first_ocurrence_of("text", @instance_tag)).to eq "Some <h1 style='background_color: black; color: white;'>text</h1> to be marked. After used TextMaker in this text it will return this text with desired text marked."
  end

  it 'Shoud return the text passed to Marker with the snippets of desired text marked, passing a default Tag' do
    expect(@instance_with_long_text).to be_a TextMarker::Marker
    expect(@instance_with_long_text.text).to eq "Some text to be marked. After used TextMaker in this text it will return this text with desired text marked."
    expect(@instance_with_long_text.mark_all_ocurrence_of("text")).to eq "Some <span style='background_color: yellow; color: black;'>text</span> to be marked. After used TextMaker in this <span style='background_color: yellow; color: black;'>text</span> it will return this <span style='background_color: yellow; color: black;'>text</span> with desired <span style='background_color: yellow; color: black;'>text</span> marked."
  end

  it 'Shoud return the text passed to Marker with the snippets of desired text marked, passing a custom Tag' do
    expect(@instance_with_long_text).to be_a TextMarker::Marker
    expect(@instance_with_long_text.text).to eq "Some text to be marked. After used TextMaker in this text it will return this text with desired text marked."
    expect(@instance_with_long_text.mark_all_ocurrence_of("text", @instance_tag)).to eq "Some <h1 style='background_color: black; color: white;'>text</h1> to be marked. After used TextMaker in this <h1 style='background_color: black; color: white;'>text</h1> it will return this <h1 style='background_color: black; color: white;'>text</h1> with desired <h1 style='background_color: black; color: white;'>text</h1> marked."
  end

  it 'Shoud return the exact same text passed to Marker, passing a default Tag and a snippet that does not exist in the text' do
    snippet_not_found_in_text = "snippet_not_found_in_text"
    text = "Some text to be marked. After used TextMaker in this text it will return this text with desired text marked."
    expect(@instance_with_long_text).to be_a TextMarker::Marker
    expect(@instance_with_long_text.text).to eq text
    expect(@instance_with_long_text.mark_first_ocurrence_of(snippet_not_found_in_text)).to eq text
    expect(@instance_with_long_text.mark_all_ocurrence_of(snippet_not_found_in_text)).to eq text
  end

  it 'Shoud return the text passed to Marker with the first snippet of desired text marked, passing a default Tag and using Marker in one line' do
    text = "Some text to be marked. After used TextMaker in this text it will return this text with desired text marked."
    expect(TextMarker::Marker.new(text).mark_first_ocurrence_of("text")).to eq "Some <span style='background_color: yellow; color: black;'>text</span> to be marked. After used TextMaker in this text it will return this text with desired text marked."
  end
end
