class ChangeCommentsIdsToInteger < ActiveRecord::Migration
  def change
    change_column :comments, :user_id, 'integer USING CAST(user_id AS integer)'
    change_column :comments, :issue_id, 'integer USING CAST(issue_id AS integer)'
  end
end
