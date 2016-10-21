class Game
  def self.start(uuid1, uuid2)
    player1, player2 = [uuid1, uuid2].shuffle

    ActionCable.server.broadcast "player_#{player1}", {action: "game_start", msg: "1"}
    ActionCable.server.broadcast "player_#{player2}", {action: "game_start", msg: "2"}

    REDIS.set("opponent_for:#{player1}", player2)
    REDIS.set("opponent_for:#{player2}", player1)
  end

  def self.correct_awnser(uuid, data)
    opponent = opponent_for(uuid)

    ActionCable.server.broadcast "player_#{opponent}", {action: "correct_awnser", msg: ...}
  end

  def self.forfeit(uuid)
    if winner = opponent_for(uuid)
      ActionCable.server.broadcast "player_#{winner}", {action: "opponent_forfeits"}
    end
  end

  def self.opponent_for(uuid)
    REDIS.get("opponent_for:#{uuid}")
  end
end
