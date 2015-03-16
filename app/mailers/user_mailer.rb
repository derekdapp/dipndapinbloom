class UserMailer < ActionMailer::Base
  default :from => "Janessa <noreply@dipndap.com>"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.notify.subject
  #
  def notify(custom)
    @custom = custom
    @url = "http://localhost:3000"
    @url += url_for custom_path(:id => @custom.id, :code => @custom.pass_key)
    mail to: custom.email, subject: "Dipndap Custom Order Update"
  end

  def custom_created_notify(custom)
    @custom = custom
    @url = "http://localhost:3000"
    @url += url_for custom_path(:id => @custom.id, :code => @custom.pass_key)
    mail to: custom.email, subject: "Dipndap Custom Order"
  end

  def paid_notify(custom)
    @custom = custom
    @url = "http://localhost:3000"
    @url += url_for custom_path(:id => @custom.id, :code => @custom.pass_key)
    mail to: custom.email, subject: "Dipndap Custom Order Paid"
  end
end
