module Api
    module V1
        class UsersController < ApplicationController
            before_action only: [:index, :show]

            def index
                @users = User.all

                render :index, status: 200 
            end

            def show
                @user = User.find(params[:id])

                render :show, status: 200
            end

            private
            
            def set_user
                @user = User.find(params[:id])
            end

            def user_params
                params.require(:users).permit(:id)
            end
        end
    end
end