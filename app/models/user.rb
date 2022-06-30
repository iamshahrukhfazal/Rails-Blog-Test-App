# frozen_string_literal: true

# Documentation for the Class
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :lockable, :confirmable

  
  after_initialize :set_default_role, if: :new_record?
  
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :reports, dependent: :destroy
  has_many :suggestions, dependent: :destroy

  enum role: { 'user' => 0, 'moderator' => 1, 'admin' => 2 }

  def set_default_role
    self.role ||= :user
  end
end
