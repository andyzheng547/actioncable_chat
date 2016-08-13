# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chatroom"
  end

  def speak(data)
    ActionCable.server.broadcast('chatroom', message: render_message(data['message']))
  end

  private
    def render_message(message)
      ApplicationController.render(partial: 'messages/message', locals: {message: message})
    end
end
