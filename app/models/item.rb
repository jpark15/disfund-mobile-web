class Item < ActiveRecord::Base

  belongs_to :settings_type, :class_name => "SettingsType", :foreign_key => "type_id"

  has_many :votes



  def vote_count
    votes.count
  end

  def has_vote_by_user(id_of_user)
    votes.where(votes: {user_id: id_of_user}).first
  end

  def get_vote(id_of_item, id_of_user)
    votes.where(votes: {user_id: id_of_user, item_id: id_of_item}).first
  end
end
