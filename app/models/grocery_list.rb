class GroceryList < ActiveRecord::Base

  belongs_to :house
  has_many :grocery_items, dependent: :destroy
  has_and_belongs_to_many :users

  validates_presence_of :name

  def as_json(opts)
    {
      id: self.id,
      name: self.name,
      house_id: self.house_id,
      users: self.users.map { |user| user.id }
    }
  end
end
