class Picture < ActiveRecord::Base
  belongs_to :imageable, :polymorphic => true

  has_attached_file :picture

  #validates_presence_of :imageable_id
  validates_attachment_content_type :picture, :content_type => ['image/jpeg', 'image/png', 'image/gif']
  validates_attachment_size :picture, :less_than => 30.kilobytes
end
