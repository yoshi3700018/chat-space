# アソシエーション設定
class GroupUser < ApplicationRecord
  belongs_to :group
  belongs_to :user
end
