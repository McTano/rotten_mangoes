class UserMailer < ApplicationMailer

  def deletion_email(user)
    @user = user
    mail(to: @user.email, subject: "You were naughty")
  end

end
