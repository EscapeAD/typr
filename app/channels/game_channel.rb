# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class GameChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream_from "player_#{uuid}"
    Search.create(uuid)
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
    Search.remove(uuid)
    Game.forfeit(uuid)
  end
end
