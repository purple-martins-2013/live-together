class Chore < ActiveRecord::Base

  validates_presence_of :title, :frequency, :points

  belongs_to :house

  def complete!(user)
    CompletedChore.create(chore_id: self.id, user_id: user.id, completed_at: Time.now)
    self.update_attributes(last_completed: Date.today, due_date: Date.today + self.frequency.days)
  end

end