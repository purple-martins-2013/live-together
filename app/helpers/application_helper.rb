module ApplicationHelper
  def current_house
    current_user.house if current_user
  end
end
