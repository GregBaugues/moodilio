class Mood < ActiveRecord::Base
  belongs_to :user, dependent: :destroy

  def image
    return 'nada.png' if score.nil?
    return 'happy.png' if score > 3
    return 'ok.png' if score > 2
    return 'sad.png' if score > 0
  end
end