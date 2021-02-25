class Book < ApplicationRecord
  belongs_to :user
  # userと関連付け

  validates :title, presence: true
  validates :body, presence: true, length: { maximum: 200 }
  # 必須入力設定validatesで対象とする項目を指定し、入力されたデータのpresence（存在）をチェック
end
