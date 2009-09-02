class Picture < ActiveRecord::Base
  belongs_to :imageable, :polymorphic => true

  has_attached_file :picture, :styles => { :original => '250x250>',
                               :small => '50x50>' },
                               :url => "/images/:attachment/:id/:style_:basename.:extension",
                               :path => ":rails_root/public/images/:attachment/:id/:style_:basename.:extension"

  validates_presence_of :imageable_id, :imageable_type
  validates_attachment_content_type :picture, :content_type => ['image/jpeg', 'image/png', 'image/gif', 'image/jpg']
  validates_attachment_size :picture, :less_than => 100.kilobytes
end
