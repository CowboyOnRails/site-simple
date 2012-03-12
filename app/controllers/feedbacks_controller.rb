# encoding: utf-8
class FeedbacksController < ApplicationController
  skip_before_filter :authenticate_user!
  respond_to :html
  def new
  	@feedback = Feedback.new
  end

   def create
    @feedback = Feedback.new(params[:feedback])

    if @feedback.valid?
      admin_email = Location.first.email
      #admin_email = 'pop-corm2@ya.ru'
      
      if FeedbackMailer.notify(@feedback,admin_email)
        flash[:notice] = "Ваше сообщение отправлено"
        redirect_to :root
      else
    	  flash[:alert] = "Не удалось отправить сообщение"
        render :action => "new"
      end

    else
      flash[:alert] = "При заполнении формы произошли ошибки"
      render :action => 'new'
    end
  end

  def human?
    @feedback.antispam.blank? ? true : false
  end
end
