class User < ActiveRecord::Base
  include Authority::UserAbilities
  rolify

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :name, :email, :password, :password_confirmation, :remember_me

  has_many :songs, foreign_key: :user_id

  def nickname
    "#{(self.name.nil? ? self.name : self.email.split('@')[0])} #{self.id.to_s}"
  end

end
