class Chore < ActiveRecord::Base

  validates_presence_of :title, :frequency

  belongs_to :house

  def due_date
    if self.last_completed
      (self.last_completed + self.frequency.days).to_formatted_s(:short)
    else
      Date.today.to_formatted_s(:short)
    end
  end

end
