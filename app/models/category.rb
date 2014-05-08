class Category < ActiveRecord::Base
  has_many :projects, -> { order("position ASC") }
  acts_as_list
end
