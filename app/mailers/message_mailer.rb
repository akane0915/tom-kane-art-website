class MessageMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.message_mailer.contact.subject

  def contact(message)
    mg_client = Mailgun::Client.new ENV['MAILGUN_API_KEY']
    mail_parameters = {from: message.email,
                      to: 'tomkaneart@gmail.com',
                      subject: "From tomkaneart.com, " + message.subject,
                      text: message.body + "\nSent by, " + message.name}
    mg_client.send_message ENV['MAILGUN_DOMAIN'], mail_parameters
  end
end
