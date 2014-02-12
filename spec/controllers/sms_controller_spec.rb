require 'spec_helper'
describe SmsController do

  it 'should recieve a SMS' do
    post :incoming
    response.should be_success
  end

end