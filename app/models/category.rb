class Category < ActiveRecord::Base
  has_many :issues
  validates :name, presence: true

  def display_name
    require 'pry'
    binding.pry
    self.name
  end
end
