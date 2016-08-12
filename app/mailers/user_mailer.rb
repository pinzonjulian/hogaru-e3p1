class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.view_stats.subject
  #
  def view_stats(email, user)
    @user = user
    @token = user.view_token
    mail to: email
  end
end
