class Comment < ActiveRecord::Base
  # so we can use `type` as column name
  self.inheritance_column = 'inherit_from'

  enum type: [:comment, :completed]

  belongs_to :issue
  belongs_to :user

  def author
    user.name
  end

  def anchor
    "issuecomment-#{id}"
  end
end
