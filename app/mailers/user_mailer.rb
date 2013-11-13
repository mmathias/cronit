class UserMailer < ActionMailer::Base
  default from: 'magnomathias21@gmail.com'

  def welcome_email(user)
      @user = user
      @url  = 'http://example.com/login'
      mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end

  def remember_email
    #get all the users
    users = User.all;
    #go through them
    users.each do |user|
      @user = user
      @user.calendars.each do |calendar|
        calendar.calendar_items.each do |calendar_item|
          @calendar_item = calendar_item
          if @calendar_item.execution_date.today?
            mail(to: @user.email, subject: 'You have a delivery today!!!')
            return
          end
        end
      end
    end
  end
end