require 'spec_helper'

describe Mood do
  it 'should return an image' do
    Mood.create(score: 5).image.should == "happy.png"
    Mood.create(score: 3).image.should == "ok.png"
    Mood.create(score: 1).image.should == "sad.png"

  end

  after :each do
    Mood.destroy_all
  end

end
