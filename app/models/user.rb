class User < ActiveRecord::Base

  def self.create_user! (user_params)
    session_token = SecureRandom.base64
    user_params[:session_token] = session_token
    create!(user_params)
  end

  def self.user_id_exists? (user_id)
    User.where(:user_id => user_id).exists?
  end
end
