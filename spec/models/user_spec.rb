describe 'User' do

  before (:each) do
    User.delete_all
    @user = User.create(name: "Bob", phone_number: "+13125551234")
    Mood.delete_all
  end

  it 'should create a mood', :vcr do
    @user.create_mood(5)
    @user.moods.last.score.should == 5
  end

  it 'should backfill modds', :vcr do
    @user.backfill_moods
    @user.moods.size.should == 6
  end

  it 'should ping', :vcr do
    @user.ping
  end

end