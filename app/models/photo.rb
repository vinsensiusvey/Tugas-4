class Photo < ActiveRecord::Base
  validates :title, presence: true

  has_attached_file :avatar, :styles => { :medium => "500x250>", :thumb => "200x100>", :default_url => ""}
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end
