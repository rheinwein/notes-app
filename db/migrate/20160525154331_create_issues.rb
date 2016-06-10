class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.text :text, null: false
      t.integer :user_id, null: false
      t.integer :category_id
      t.datetime :completed_at
      t.integer :completed_by

      t.timestamps null: false
    end
  end
end
