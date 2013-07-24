class Post < ActiveRecord::Base
  belongs_to :user

  validates :title, presence: true

  mount_uploader :image, ImageUploader
	# def mundane
	# 'it is'
	# end

end
