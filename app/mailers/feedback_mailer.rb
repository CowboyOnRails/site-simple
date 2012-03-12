# encoding: utf-8
class FeedbackMailer < ActionMailer::Base
  layout 'mailer'
  def notify(feedback,to_email)
    @feedback = feedback
    @subject  = "Сообщение из формы обратной связи"

    letter = mail(:from => @feedback.email, :to => to_email, :subject => @subject)
    letter.deliver ? true : false
  end
end