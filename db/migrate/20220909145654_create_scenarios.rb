class CreateScenarios < ActiveRecord::Migration[6.1]
  def change
    create_table :scenarios do |t|
      
      ##ユーザーIDを保存するカラム
      t.integer :user_id, null: false
      
      ##ジャンルIDを保存するカラム
      t.integer :genre_id, null: false
      
      ##タイトルを保存するカラム
      t.string :title, null: false
      
      ##概要を保存するカラム
      t.string :overview, null: false
      
      ##コンテンツを保存するカラム
      t.text :content, null: false
      
      t.timestamps
    end
  end
end
