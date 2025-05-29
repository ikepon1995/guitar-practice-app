class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

   # 今後の投稿・コメント連携のための関連づけ（今はまだpostしか使わない）
  has_many :posts, dependent: :destroy
  # コメント、いいね用の追加予定↓
  # has_many :comments, dependent: :destroy
  # has_many :likes, dependent: :destroy
end
