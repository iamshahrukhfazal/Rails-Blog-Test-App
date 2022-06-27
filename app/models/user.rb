class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :lockable, :confirmable

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :reports, dependent: :destroy
  has_many :suggestions,dependent: :destroy
  # has_one_attached :image
  enum role: ["user","moderator", "admin"]
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role 
    self.role ||= :user
  end

end
