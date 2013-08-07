class CommentNotificationMailer < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.comment_notification_mailer.notification.subject
  #
  def notification
    
    mail to: "andrewlapoint@gmail.com"
    #@greeting = "Hi"

    #mail to: "to@example.org"
  end
end
