class User < ActiveRecord::Base

  has_many :votes

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :admin, inclusion: { in: [true, false] }

  before_save :non_admin_user

  def non_admin_user
    self.admin ||= false
  end
         
end
