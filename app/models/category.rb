class Category < ActiveRecord::Base
  has_many :projects, -> { order("position ASC") }
end
