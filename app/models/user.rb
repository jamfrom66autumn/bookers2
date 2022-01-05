class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :user
  has_many :books, dependent: :destroy
  attachment :image

  validates :name, presence: true
  validates :name, length: {minimum: 2}
  validates :name, length: {maximum: 20}
  validates :name, uniqueness: true
  validates :introduction, length: { maximum: 50}


end
