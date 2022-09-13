class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      
      ##ユーザーIDを保存するカラム
      t.integer :user_id, null: false
      
      ##シナリオIDを保存するカラム
      t.integer :scenario_id, null: false
      
      ##コメント本文を保存するカラム
      t.string :review, null: false
      
      t.timestamps
    end
  end
end
