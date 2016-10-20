module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :uuid

  def connect
    self.uuid = SecureRandom.uuid
  end

    # identified_by :current_user
    #
    # def connect
    #   current_user = verified_user
    # end
    #
    # protected
    #
    # def verified_user
    #   if current_user == User.find_by(id: cookies.signed['user.id'])
    #     current_user
    #   else
    #     reject_unauthorized_connection
    #   end
    # end

  end
end
