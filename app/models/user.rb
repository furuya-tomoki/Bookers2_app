class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # 自動追加

  has_many :books, dependent: :destroy
  # booksと関連付け

  attachment :profile_image
  # 画像アップ用のメソッド（attachment）を追加してフィールド名に（profile_image）を指定

  validates :name, uniqueness: true, length: { in: 2..20 }
  validates :introduction, length: { maximum: 50 }
  # 必須入力設定validatesで対象とする項目を指定し、入力されたデータのpresence（存在）をチェック
end
