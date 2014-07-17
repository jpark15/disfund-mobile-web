class SettingsType < ActiveRecord::Base
  include ApplicationHelper

  has_many :expenditures, :foreign_key => "type_id"

  validates_associated :expenditures

  before_validation :set_internal_symbol

  validates :description, presence: true
  validates :internal_symbol, presence: true, uniqueness: true

  def set_internal_symbol
    self.internal_symbol = snakecase(description) unless description.nil?
  end
end
