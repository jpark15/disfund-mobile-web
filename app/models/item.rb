class Item < ActiveRecord::Base

  belongs_to :settings_type, :class_name => "SettingsType", :foreign_key => "type_id"

  has_many :votes

  validates :name, presence: true
  validates :cost, numericality: true, presence: true

  validate :settings_type_not_nil

  # Custom Validation
  def settings_type_not_nil
    if type_id.blank?
      errors.add(:type_id, "not selected or unavailable")
    end
  end

  # Other Methods
  def vote_count
    votes.count
  end

  def has_vote_by_user(id_of_user)
    votes.where(votes: {user_id: id_of_user}).first
  end

  def get_vote(id_of_item, id_of_user)
    votes.where(votes: {user_id: id_of_user, item_id: id_of_item}).first
  end

  def self.order_votes
    sql = <<SQL
      select items.*, count(votes.id) as votes_count 
      from items 
      left join votes on votes.item_id = items.id 
      group by items.id 
      order by votes_count desc;
SQL
    find_by_sql(sql)
  end
end
