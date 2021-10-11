class MessagesController < ApplicationController
  def index
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      MessageMailer.with(message: @message).new_message_email.deliver_later
      flash[:success] = t('message_success')
      redirect_to root_path(:anchor => 'contact')
    else
      flash[:error] = t('message_error')
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def message_params
    params.require(:message).permit(:name, :email, :content)
  end
end
