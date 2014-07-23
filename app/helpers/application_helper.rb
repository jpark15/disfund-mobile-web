module ApplicationHelper
  def snakecase(str)
    str.gsub(' ', '_').downcase
  end
end
