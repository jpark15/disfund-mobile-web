class SettingsType < ActiveRecord::Base
  
  has_many :expenditures

  validates_associated :expenditures

  validates :description, presence: true
  # internal_symbol will be completed automatically

end
