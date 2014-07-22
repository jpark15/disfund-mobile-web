class User < ActiveRecord::Base

  has_many :votes

  before_validation :non_admin_user_default

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :admin, inclusion: { in: [true, false] }

  def non_admin_user
    admin = false
  end
end
