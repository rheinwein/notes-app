class User < ActiveRecord::Base
  has_many :issues
  has_many :comments, through: :issues

  validates :name, presence: true
  validates :chip_id, presence: true
end
