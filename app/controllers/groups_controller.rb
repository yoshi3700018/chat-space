# コマンドrails g controller groupsで作成されたファイル
class GroupsController < ApplicationController

  def new #新規登録に必要なアクション
  end

  def create #新規登録に必要なアクション→ルーティング設定 resources :groups, only: [:new, :create] を設定
  end


end
