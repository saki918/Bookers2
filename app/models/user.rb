class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books, dependent: :destroy
  attachment :profile_image # ここを追加

  validates :name, presence: true, length: { in: 2..20 }
  validates :introduction, length: { maximum: 50 }
  def current_user?(user)
    user == current_user
  end
end
