class Chore < ActiveRecord::Base

  validates_presence_of :title, :frequency

  belongs_to :house

end
