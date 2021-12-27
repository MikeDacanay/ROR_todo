module Api
    module V1
        class ItemsController < ApplicationController
            skip_before_action :verify_authenticity_token

            def show
                @item = Item.find(params[:id])
                render json: @item, status: 200
            end

            def create 
                @item = user.items.new(item_params)
                if @item.save
                    render :create, status: 200
                else
                    render json: {error: @user.errors.message}, status: 422
                end
            end

            def update
            end

            def destroy
            end

            private

            def user
                @user ||= User.find(params[:user_id])
            end

            def item_params
                params.require(:item).permit(:title, :description)
            end
        end
    end
end