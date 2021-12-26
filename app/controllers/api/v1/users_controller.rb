module Api
    module V1
        class UsersController < ApplicationController
            skip_before_action :verify_authenticity_token
            before_action only: [:update, :create, :index, :show, :destroy]

            def index
                @users = User.all

                render :index, status: 200 
            end

            def show
                @user ||= user

                render :show, status: 200
            end

            def create
                @user = User.new(user_params)

                if @user.save
                    render :show, status: 200
                else
                    render error
                end
            end

            def update
                @user ||= user

                if @user.update(user_params)
                    render :update, status: 200
                else
                    render error
                end
            end


            def destroy
                @user ||= user

                if @user.destroy
                    render json: {message: "User ID:#{params[:id]} deleted"}
                else
                    render error
                end
            end

            private

            def user_params
                params.require(:user).permit(:username, :password)
            end

            def user
                User.find(params[:id])
            end

            def error
                json: {error: @user.errors.message}, status: 422
            end
        end
    end
end