class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.notify.subject
  #
  def notify(custom)
    @custom = custom
    @url = "http://localhost:3000"
    @url += url_for custom_path(:id => @custom.id, :code => @custom.pass_key)
    mail to: custom.email, subject: "Custom Order from Dipndap"
  end
end
