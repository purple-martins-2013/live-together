class Chore < ActiveRecord::Base

  validates_presence_of :title, :frequency, :points

  belongs_to :house

  def due_date
    if self.last_completed
      self.last_completed + self.frequency.days
    else
      Date.today
    end
  end

end
