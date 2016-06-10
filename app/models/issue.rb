class Issue < ActiveRecord::Base
  belongs_to :user
  has_many :comments

  scope :completed, -> {
    where('completed_at IS NOT NULL').order('completed_at DESC')
  }

  scope :incomplete, -> {
    where('completed_at IS NULL').order('updated_at DESC')
  }

  validates :text, presence: true, on: :create
  # validates :text, length: { minimum: 20 }

  def completed?
    return true if completed_at

    false
  end

  def completed_by
    u = User.find_by_id(read_attribute(:completed_by))
    return u if u

    User.new(name: 'Deleted User')
  end

  def user
    u = User.find_by_id(read_attribute(:user_id))
    return u if u

    User.new(name: 'Deleted User')
  end

  def sorted_comments
    comments.order('created_at asc')
  end
end
