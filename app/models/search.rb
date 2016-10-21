class Search
  def self.create(uuid)
    if opponent = REDIS.spop("searchs")
      Game.start(uuid, opponent)
    else
      REDIS.sadd("searchs", uuid)
    end
  end

  def self.remove(uuid)
    REDIS.srem("searchs", uuid)
  end

  def self.clear_all
    REDIS.del("searchs")
  end
end
