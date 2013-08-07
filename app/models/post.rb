class Post < ActiveRecord::Base
  belongs_to :user

  validates :title, presence: true

  mount_uploader :image, ImageUploader
	# def mundane
	# 'it is'
	# end
	after_create :send_notification

	def say_something
		puts self.body
	end

	private

	def send_notification
		#generates and delivers a notification email
		CommentNotificationMailer.notification(self).deliver
	end
end
