class User < ActiveRecord::Base
  def create_user! (user_params)
    session_token = SecureRandom.base64
    user_params.merge(session_token: session_token)
    self.create_user user_params
  end
end