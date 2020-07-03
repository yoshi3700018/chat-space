# コマンドrails g controller groupsで作成されたファイル
class GroupsController < ApplicationController

  def index
  end

  def new #新規登録に必要なアクション
    @group = Group.new #newアクション中で@gに空インスタ代入。form_withで使用する変数。
    @group.users << current_user #「<<」配列に要素を追加する。CS仕様でg新規作成時必ずログインユーザーを含めたいので予め追加。
  end

  def create #新規登録に必要なアクション→ルーティング設定 resources :groups, only: [:new, :create] を設定
    @group = Group.new(group_params)
    if @group.save
      redirect_to root_path, notice: 'グループを作成しました'
    else
      render :new
    end #保存の状態で分岐。OKならif。違ったらelseで新規登録画面。redirectはリクエスト送信と同じでC→V。renはそのままV。これにより元のインスタンス変数の値が上書きされるかどうかが違ってくる。今回はgが保存されなかったらフォームに入力内容を保持してグループ作成画面を表示。
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
      redirect_to root_path, notice: 'グループを更新しました'
    else
      render :edit
    end
  end

  private
  def group_params
    params.require(:group).permit(:name, user_ids: []) #ストロングパラメーター。配列に対し保存を許可したい場合キーの名称と関連づけてバリューに「[]」と記述。
  end
end
