class CreateGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :groups do |t| #これはどういう意味？
      t.string :name, null: false #インデックスを貼る、これでCREATETABLE時？にインデックスも定義される。（データ検索高速化、カラムに対して設定）
      t.index :name, unique: true #これはどういう意味？
      t.timestamps
    end
  end
end
