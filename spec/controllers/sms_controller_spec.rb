require 'spec_helper'
describe SmsController do

  it 'should recieve a SMS' do
    get :index
    response.should be_success
  end

end