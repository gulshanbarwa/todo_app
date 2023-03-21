class PostMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.post_mailer.post_created.subject
  #
  #def post_created
  #  @greeting = "Hi"
  #  mail(to: "bunny.b4444@gmail.com", from: "appsmtp159@gmail.com", subject: "New post") do |format|
  #    format.html { render 'post_mailer/post_created' }
   # end
  #end
  #end

  #def post_created(message)
   # @message = message
    #mail(to: "bunny.b4444@gmail.com", from: "appsmtp159@gmail.com", subject: "New post") do |format|
    #  format.html { render 'post_mailer/post_created' }
    #end
  #end
  #end
  def post_created(message,email)
    if message.present?
      @message = message
      mail(to: email, from: "appsmtp159@gmail.com", subject: "New post") do |format|
        format.html { render 'post_mailer/post_created',message: @message}
      end
    end
  end
end
  