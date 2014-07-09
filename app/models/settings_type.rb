class SettingsType < ActiveRecord::Base
  include ApplicationHelper

  has_many :expenditures, :foreign_key => "type_id"

  validates_associated :expenditures

  validates :description, presence: true
  validates :internal_symbol, presence: true

  before_validation :set_internal_symbol

  def set_internal_symbol
    self.internal_symbol = snakecase(description) unless description.nil?
  end
end
