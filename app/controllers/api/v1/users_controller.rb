module Api
    module V1
        class UsersController < ApplicationController
            def index
                @users = User.all

                render :index, status: 200 
            end

        end
    end
end