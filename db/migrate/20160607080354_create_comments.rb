class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :text
      t.string :user_id, null: false
      t.string :issue_id, null: false
      t.integer :type, default: 0

      t.timestamps null: false
    end
  end
end
