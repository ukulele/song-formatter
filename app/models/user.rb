class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  include Authority::UserAbilities
  rolify

  # attr_accessible :name, :email, :password, :password_confirmation, :remember_me

  has_many :songs, foreign_key: :user_id

  def nickname
    "#{(self.name.nil? ? self.name : self.email.split('@')[0])} #{self.id.to_s}"
  end

end
