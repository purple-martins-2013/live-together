class CompletedChore < ActiveRecord::Base
  belongs_to :chore
  belongs_to :user
  belongs_to :house

  def as_json(opts)
    {
      title: self.chore.title,
      points: self.chore.points,
      id: self.id,
      user: self.user.email,
      house_id: self.house_id,
      completed_at: self.completed_at.to_formatted_s(:short)
    }
  end
end
