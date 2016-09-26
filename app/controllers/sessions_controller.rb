class SessionsController < ApplicationController

  def session_params
    params.require(:session).permit!
  end

  def new

  end

  def create
    user = User.find_by_user_id (session_params[:user_id]) # lookup user in db
    user_email = User.find_by_email(session_params[:email])
    if user.nil? || user_email.nil? # if user is not found or email is not found unsuccessful login
      flash[:notice] = 'Invalid User ID/Email combination'

      redirect_to login_path
    else
      session_token = user.session_token # lookup user's session token from db
      session[:session_token] = session_token # stores user's session token inside session cookie
      redirect_to movies_path
    end
  end

  def destroy # handle logout
    session[:session_token] = nil
    redirect_to movies_path
  end
end


# SQLite3::SQLException:
#     no such column:
#                 session_token.id:
#     SELECT "users".* FROM "users" WHERE "session_token"."id" = 1 AND "session_token"."user_id" = 'ladkjflkkj' AND "session_token"."email" = 'lakdjfldj' AND "session_token"."session_token" IS NULL AND "session_token"."created_at" = '2016-09-25T00:28:06.487Z' AND "session_token"."updated_at" = '2016-09-25T00:28:06.487Z' LIMIT 1

