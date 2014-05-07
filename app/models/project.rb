class Project < ActiveRecord::Base
  has_attached_file :attachment, :styles => { :large => "1024x768>", :thumb => "200x150>" }
  do_not_validate_attachment_file_type :attachment
  validates_uniqueness_of :name
  belongs_to :category
  acts_as_list scope: :category
end
