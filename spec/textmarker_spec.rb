require 'spec_helper'

describe "TextMarker::Marker" do
  before(:each) do
    @instance_default = TextMarker::Marker.new
  end

  it 'Shoud create a Marker object' do
    expect(@instance_default).to be_a TextMarker::Marker
  end
end
