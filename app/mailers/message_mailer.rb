class MessageMailer < ApplicationMailer
  def new_message_email
  @message = params[:message]

  mail(to: "contact@fannymaurel.com", subject: "Nouveau message sur fannymaurel.com")
  end
end
