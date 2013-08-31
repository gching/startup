class Review < ActiveRecord::Base


  attr_accessible  :name, :feedback, :user_id

 belongs_to :user



end