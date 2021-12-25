module Api
    module V1
        class UsersController < ApplicationController
            skip_before_action :verify_authenticity_token
            before_action only: [:index, :show, :update]

            def index
                @users = User.all

                render :index, status: 200 
            end

            def show
                @user = User.find(params[:id])

                render :show, status: 200
            end

            def create
                @user = User.new(user_params)

                if @user.save
                    render :show, status: 200
                else
                    render json: {error: @user.errors.message}, status: 422
                end
            end

            def update
                @user = User.find(params[:id])

                if @user.update(user_params)
                    render :update, status: 200
                else
                    render json: {error: @user.errors.message}, status: 422
                end
            end

            private

            def user_params
                params.require(:user).permit(:username, :password)
            end
        end
    end
end