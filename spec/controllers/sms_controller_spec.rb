require 'spec_helper'
describe SmsController do

  it 'should create a user and send response', :vcr do
    post :incoming, {'From' => '+13129526796', 'Body' => 'Greg Baugues'}
    user = User.first
    user.name.should == "Greg Baugues"
    user.phone_number.should == "+13129526796"
    expect(response).to render_template("empty_response")
  end

end