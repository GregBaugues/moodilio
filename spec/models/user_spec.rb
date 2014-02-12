describe 'User' do

  before (:each) do
    User.create(name: "Bob", phone_number: "+13125551234")
  end

  it 'should create a mood', :vcr do
    user = User.first
    user.create_mood(Date.today, 5)
    user.moods.first.score.should == 5
  end

end