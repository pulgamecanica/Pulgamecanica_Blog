class Author < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable
  has_many :posts
  has_many :projects
  has_many :pages

  validates :bg_choice, numericality: { in: 1..10 }
end
