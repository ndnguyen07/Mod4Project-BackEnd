class UsersController < ApplicationController
    skip_before_action :authorized, only: [:create, :profile]

    def index
        @users = User.all
        render json: @users
    end

    def profile
      @user = User.find_by(username: user_params[:username])
      if @user && @user.authenticate(user_params[:password])
        token = encode_token({ user_id: @user.id })
        render json: { user: @user.id, jwt:token }, status: :accepted
      else
        render json: { message: 'Invalid username or password' }, status: :unauthorized
      end
    end

    def create
        @user = User.create(user_params)
        # byebug
        if @user.valid?
            token = encode_token({ user_id: @user.id })
            render json: { user: @user.id, jwt: token }, status: :accepted
        else
          render json: { error: 'failed to create user' }, status: :not_acceptable
        end
      end
     
      private
      def user_params
        params.require(:user).permit(:username, :password)
      end
end
