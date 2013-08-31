class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me, :image
  mount_uploader :image, ImageUploader

	validates :name, presence: true

# Events user makes
  has_many :events, class_name: "Event", foreign_key: "author_id", dependent: :destroy

  # Event user receives
  has_many :received_events, class_name: "Event", foreign_key: "user_id", dependent: :destroy

  has_many :photos, :class_name => "Photo", :foreign_key => "uploader_id", dependent: :destroy
  has_many :received_photos, :class_name => "Photo", :foreign_key => "user_id", dependent: :destroy

  has_many :reviews, dependent: :destroy


end