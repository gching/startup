class Photo < ActiveRecord::Base
  #include PublicActivity::Common

  #has_many :comments, as: :commentable

  # Uploader for file
  mount_uploader :image, ImageUploader


  attr_accessible :image, :name, :user_id, :uploader_id

 belongs_to :user
  belongs_to :uploader, :class_name => "User", :foreign_key => "uploader_id"
  validates :image, presence: true
  validates :name, presence: true
 # validates :document_id, presence: true
  #validates :user_id, presence: true
  #validates :uploader_id, presence: true
  default_scope order: 'photos.created_at DESC'


  
end
