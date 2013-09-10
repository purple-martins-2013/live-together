class CompletedChore < ActiveRecord::Base
  belongs_to :chore
  belongs_to :user
  belongs_to :house
end
