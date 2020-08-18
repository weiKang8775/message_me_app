class ChatroomController < ApplicationController
  before_action :require_user, only: [:index]

  def index
    @messages = Message.custom_display
    @message = Message.new
    @friends ||= current_user.friends
  end
end