class Vote < ActiveRecord::Base

  belongs_to :user
  belongs_to :item

  validates :user_id, numericality: true, presence: true
  validates :item_id, numericality: true, presence: true

end
