class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts
  has_many :comments
  has_many :likes
  has_many :reports
  has_many :suggestions


  # has_one_attached :image


  enum role: [:user,:moderator, :admin]

  after_initialize :set_default_role, :if => :new_record?

  def set_default_role 
    self.role ||= :user
  end

end
