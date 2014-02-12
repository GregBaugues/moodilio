describe 'User' do

  before (:each) do
    @user = User.create(name: "Bob", phone_number: "+13125551234")
  end

  it 'should create a mood', :vcr do
    @user.create_mood(Date.today, 5)
    @user.moods.first.score.should == 5
  end

  it 'should backfill modds', :vcr do
    @user.backfill_moods
    @user.moods.size.should == 7
  end

end