# アソシエーションを設定する。
class Group < ApplicationRecord
  has_many :group_users
  has_many :users, through: :group_users #多対多記述。has_many引数に「アソシ組みたいテーブル名」を、:throughのバリューに「中間テーブル名」を指定。これで「group.users」といった呼出ができる。
  has_many :messages
  validates :name, presence: true, uniqueness: true

  def show_last_message
    if (last_message = messages.last).present?
      if last_message.content?
        last_message.content
      else
        '画像が投稿されています'
      end
    else
      'まだメッセージはありません。'
    end
  end
end
