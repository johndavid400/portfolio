class Project < ActiveRecord::Base
  has_attached_file :attachment, :styles => { :large => "1024x768>", :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  do_not_validate_attachment_file_type :attachment
  validates_uniqueness_of :name
end
