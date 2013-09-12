class Chore < ActiveRecord::Base

  validates_presence_of :title, :frequency, :points

  belongs_to :house
  has_many :completed_chores

  before_create do
    self.due_date = Date.today
  end

  def complete!(user, house)
    house.completed_chores.create(chore_id: self.id, user_id: user.id, completed_at: Time.now)
    self.update_attributes(last_completed: Date.today, due_date: Date.today + self.frequency.days)
    user.update_attributes(points: user.points + self.points);
  end

end