require 'spec_helper'
describe 'SMS Controller' do

  before(:all) do
  end

  it 'should recieve a SMS' do
    get '/sms'
  end

end