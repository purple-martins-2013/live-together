require 'spec_helper'

feature 'Chores List', feature: true do

  before(:all) do
    @user = FactoryGirl.create(:user)
    @house = FactoryGirl.create(:house)
    @chore = @house.chores.create(title: 'fizz', frequency: 7, points: 15)
    @user.house = @house
    @user.save
  end
end
